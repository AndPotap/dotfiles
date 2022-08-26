let s:gb.fff   = ['#b16286', 6]
let s:gb.bbb   = ['#b16286', 74]
let s:bbb = s:gb.bbb

hi! link textComment   GruvboxGray
hi! link textComment2  BBB
hi! link textUnderline FFF
hi! link textCode      GruvboxRed
hi! link textTitle1    GruvboxPurple
hi! link textTitle2    GruvboxBlue
hi! link textAr        GruvboxOrange
hi! link textBullet    GruvboxGray

syn match textComment "\"\_.\{-}\""
syn match textComment2 "\`\_.\{-}\`"
syn match textUnderline "<\_.\{-}>"
syn match textAr "@\((\_.\{-})\)"
syn match textCode "\$\[\_.\{-}\]"
syn match textTitle1 "%%%%.*$"
syn match textTitle2 "##.*$"
syn match textBullet "*\s"
