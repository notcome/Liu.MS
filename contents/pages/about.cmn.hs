{-document :: [m Tree] -> m Tree
document = Parent
  newNode
-}

fragment = (section <+> id_ "about-me-cmn" <+> lang="cmn")
  [ warningAtDate "2016-09-01" "更新就读年级"
  , par ["我现在是一名大一学生，就读于加州大学圣迭戈分校。我的专业是语言学，计划第二专业数学\
      \、辅修政治科学。"]
  , par ["我的母语是", mandarin, "英语是我的第二语言，但掌握不够熟练：词汇——尤其是生活词\
      \汇和生僻词——掌握较少，口语能力较差。我并不会其它语言。"]
  , par ["学术方面，我主要对计算语言学和程序语言理论比较感兴趣。具体到动机，我是", strongAI,
      "的支持者，希望提高机器对语言处理与理解的能力，并相信先进的编程语言是复杂的软件项目如人\
      \工智能的基石。我没有选择在本科就读计算机科学专业，有如下原因："]
  , ulist
    [ item ["我已有多年编程经验", csExp, "有算法竞赛的基础，可以自学计算机科学相关的知识。"
           ]
    , item ["本校的学分限制。我本科四年最多只能学习六十门课，如果我选择计算机科学专业，我将\
        \失去学习数学、政治科学、或其它人文科学的机会。"]
    , item ["我较为懒散。为了", nlp, "去学习机器学习，或者为了编程去学习", archery, "这\
        \些「刚需」我还勉强能满足。可是，又有什么刚需让我去读古代经典或者高阶的数学呢？"]
    ]
  , par ["如上所述，我较为懒散。本网站建立的动机之一便是希望实时更新我的工作进度，通过发布至\
      \互联网产生有人监视的错觉，提高我的工作效率。"]
  , par ["我对界面设计比较感兴趣。此处的「界面」不仅仅指图形用户界面，它包括了从微波炉按钮到\
      \网页组织结构的一切广义的界面。不过，我主要的兴趣还是在图形用户界面上。"]
  , par ["目前我最喜欢的英文衬线体是", charter, "不过我并不觉得它算真正意义的衬线体，其衬\
      \线粗且平直，并不像其它经典的衬线体一样有尖锐的衬线。我更多地是将其看作一种有着衬线作视\
      \觉补偿的无衬线体。"]
  , par ["我喜欢讲一些奇诡的笑话，被朋友评为「恶意卖萌」、「爱讲冷笑话」。"]
  ]
  where
    wikiLink label = C.link label ("https://zh.wikipedia.org/wiki/" <> label)

    mandarin = wikiLink "官话"
    strongAI = wikiLink "强人工智能"
    nlp      = wikiLink "自然语言处理"
    archery  = wikiLink "范畴论"
    csExp    = LMS.sideNote "我没有多少大项目的经验，更多的都是小玩具与原型。"
    charter  = C.link "Charter" "https://en.wikipedia.org/wiki/Bitstream_Charter"

fragment' = [skribilo|
  (section :id "about-me-cmn"
           :lang "cmn"
    (warning-at-date "2016-09-01" "更新就读年级")
    %% promoting text node to paragraph node when appropriate, e.g. inside a
    %% section environment
    [我现在是一名大一学生，就读于加州大学圣迭戈分校。我的专业是语言学，计划第二专业数学、辅修政
    治科学。]
    %% space is automatically removed around ,(...), using explicit "\ " instead
    [我的母语是 ,(mandarin) "英语是我的第二语言，但掌握不够熟练：词汇——尤其是生活词汇和生僻
    词——掌握较少，口语能力较差。我并不会其它语言。"]
    [学术方面，我主要对计算语言学和程序语言理论比较感兴趣。具体到动机，我是 ,(strongAI) 的支
    持者，希望提高机器对语言处理与理解的能力，并相信先进的编程语言是复杂的软件项目如人工智能的
    基石。我没有选择在本科就读计算机科学专业，有如下原因：]
    (ulist
      %% consider the indentation for [...]
      %% and when to add a space for a new line, e.g. the first character in the
      %% new line is a letter
      (item [我已有多年编程经验 ,(csExp) 有算法竞赛的基础，可以自学计算机科学相关的知识。])
      (item [本校的学分限制。我本科四年最多只能学习六十门课，如果我选择计算机科学专业，我将失
            去学习数学、政治科学、或其它人文科学的机会。])
      %% how to express ",(...)"?
      %% consider ,(id ",(...)")
      (item [我较为懒散。为了 ,(nlp) 去学习机器学习，或者为了编程去学习 ,(archery) 这些
            「刚需」我还勉强能满足。可是，又有什么刚需让我去读古代经典或者高阶的数学呢？]))
  )|]
