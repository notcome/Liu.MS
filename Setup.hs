import Data.Maybe
import Distribution.ModuleName
import Distribution.PackageDescription
import Distribution.Simple
import Distribution.Text
import System.Process

main = defaultMainWithHooks $ simpleUserHooks
  { preConf = findTeXModules
  }

findTeXModules :: Args -> ConfigFlags -> IO HookedBuildInfo
findTeXModules args confFlags = do
  preConf simpleUserHooks args confFlags
  desc' <- readDesc simpleUserHooks
  let srcDirs' = do
    desc <- readDesc simpleUserHooks
    lib  <- library desc
    return $ hsSourceDirs $ libBuildInfo lib
  let srcDirs = case srcDirs' of Nothing -> ["."]
                                 Just ds -> ds
  texModules = concat <$> map findTeXModulesInDir srcDirs
  let buildInfo = emptyBuildInfo { otherModules = texModules }
  return (Just buildInfo, [])

  where
    listTexFiles    :: FilePath -> IO [FilePath]
    listTexFiles base = do
      let findCmd = shell "find " ++ base ++ " -name '*.tex'"
      output <- readCreateProcess findCmd ""
      return $ lines output

    texFileToModule :: FilePath -> FilePath -> Maybe ModuleName
    texFileToModule base path = let
      -- length base + 1: remove first slash after the base directory
      -- base = contents
      -- path = contents/...
      baseRemoved = drop (length base + 1) path
      extRemoved  = take (length baseRemoved - length ".tex") baseRemoved
      moudleName  = flip map extRemoved (\c -> case c of '/' -> '.'; _ -> c)
      in simpleParse moudleName

    findTeXModulesInDir :: FilePath -> IO [ModuleName]
    findTeXModulesInDir base = do
      let toModule = texFileToModule base
      list <- listTexFiles base
      let modules  = catMaybes $ map toModule list
      return modules
