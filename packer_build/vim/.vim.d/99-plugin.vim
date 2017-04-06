call dein#add('regedarek/ZoomWin')
call dein#add('Rykka/clickable.vim')
call dein#add('Rykka/riv.vim')


if dein#check_install()
  call dein#install()
endif
