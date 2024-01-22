id=:3 :'y*(y-:y)*.((*./"1) __<+.y)*.(*./"1(+.y)<_)'
qfa=:2 :0
NB. quadrature, folding, adaptive
NB. f qfa(a,b,patience,epsz,wanna_print) gives us an approximation of the
NB. integral \int_a^b f(x) dx.
  'a b patience epsz wanna_print'=.n,(#n)}.0 1 10 1e_12 0
  Yb=.2 :'(u >:n-%y)%*:y'
  Ya=.2 :'(u <:n+%y)%*:y'
  Y=.1 :'(u (y-0.5)%y*-.y)*(0.5-y*-.y)%*:y*-.y'
  if. a=b do. 0 return. end.
  if. a>b do. -(u qfa(b,a,patience,epsz,wanna_print)) return. end.
  if. (a=__)*.(__<b)*.(b<_) do.
    (u Yb b)qfa(0 1,patience,epsz,wanna_print) return.
  end.
  if. (__<a)*.(a<_)*.(b=_) do.
    (u Ya a)qfa(0 1,patience,epsz,wanna_print) return.
  end.
  if. (a=__)*.(b=_) do.
    (u Y)qfa(0 1,patience,epsz,wanna_print) return.
  end.
  c=. 0.0051282051282051282051282051282051281759 0.048699387295088238550645108490909649756 0.097820391676052159128537348618992594511 0.13966507849560431803157492542792136238 0.17560578900106674676537594695346634661 0.20205146748238357363676732792567368935 0.21888151163057340179839439673523336642 0.22429633858205286776715348143919572482 0.21888151163057340179839439673523336641 0.20205146748238357363676732792567368937 0.17560578900106674676537594695346634660 0.13966507849560431803157492542792136237 0.097820391676052159128537348618992594505 0.048699387295088238550645108490909649754 0.0051282051282051282051282051282051281921
  XX=._1.0000000000000000000000000000000000000 _0.99371220989324258353314824194737869715 _0.97492791218182360701813168299393121723 _0.94388333030836756289526360715103662152 _0.90096886790241912623610231950744505116 _0.84672419922828416835277581626296527151 _0.78183148246802980870844452667405775024 _0.70710678118654752440084436210484903929 _0.62348980185873353052500488400423981064 _0.53203207651533656355763036723037073017 _0.43388373911755812047576833284835875461 _0.33027906195516708177487761259657237031 _0.22252093395631440428890256449679475947 _0.11196447610330785846870593527202420326 0 0.11196447610330785846870593527202420326 0.22252093395631440428890256449679475947 0.33027906195516708177487761259657237031 0.43388373911755812047576833284835875461 0.53203207651533656355763036723037073017 0.62348980185873353052500488400423981063 0.70710678118654752440084436210484903928 0.78183148246802980870844452667405775023 0.84672419922828416835277581626296527151 0.90096886790241912623610231950744505116 0.94388333030836756289526360715103662152 0.97492791218182360701813168299393121723 0.99371220989324258353314824194737869715 1.0000000000000000000000000000000000000
  cc=.0.0012771392081736909323116219667943805384 0.012261863082965059183757260672587997397 0.025073542949876119982835702556885437729 0.037003488124485205952410988595758198919 0.048714184513998659016006832920198121119 0.059671722500291530510800360039061795198 0.069971720188124901715360725785693207337 0.079324399141810206291234242539439122598 0.087731808647660728388301226283541406525 0.094993231127670812935868864274475598423 0.10109644009839900606731621967353236674 0.10589618899078746036382490403487686430 0.10939348026402093482773831077366493146 0.11148767663607657022825919082719761136 0.11220622905131822720794709811258591222 0.11148767663607657022825919082719761137 0.10939348026402093482773831077366493147 0.10589618899078746036382490403487686430 0.10109644009839900606731621967353236673 0.094993231127670812935868864274475598407 0.087731808647660728388301226283541406539 0.079324399141810206291234242539439122596 0.069971720188124901715360725785693207342 0.059671722500291530510800360039061795189 0.048714184513998659016006832920198121113 0.037003488124485205952410988595758198910 0.025073542949876119982835702556885437708 0.012261863082965059183757260672587997395 0.0012771392081736909323116219667943805590
  if. wanna_print do.
    echo 'a';a;'b';b;'patience';patience
  end.
  M=.-:a+b
  if. a=b do.
    0*u M return.
  end.
  h=.-:b-a
  fXX=.u"0 M+h*XX
  fX=.(2*i.#c){fXX
  H=.h*+/cc*fXX
  L=.h*+/c*fX
  if. epsz>>./|,L-H do.
    H return.
  end.
  if. 0<patience do.
    (u qfa(a,M,(<:patience),epsz,wanna_print)) + (u qfa(M,b,(<:patience),epsz,wanna_print))
    return.
  end.
  H
)

qqfa=:2 : 0
  'a b c d patience epsz wanna_print'=.n,(#n)}.0 1 0 1 6 1e_12 0
  M=.2 :'(y&u) qfa n'
  (u M (c,d,patience,epsz,wanna_print)) qfa(a,b,patience,epsz,wanna_print)
)

qqqfa=:2 :0
  'a b c d e f patience epsz wanna_print'=.n,(#n)}.0 1 0 1 0 1 5 1e_12 0
  M=.1 :'u x,y'
  N=.2 :'(2{.y)&(u (1 :''u x,y'')) qfa n'
  (u N (e,f,patience,epsz,wanna_print)) M qqfa(a,b,c,d,patience,epsz,wanna_print)
)

Note'Sample run'
   (>:p:i.3 4)-%3 :'y^p:i.3 4' qfa ''
 4.44089e_16            0  8.88178e_16            0
_3.55271e_15            0 _3.55271e_15 _3.55271e_15
_7.10543e_15 _1.42109e_14 _1.42109e_14 _1.42109e_14

   3 :'(^-y)**:1 o. y' qfa 0 1000-0.4
5.55112e_17

   3 :'%:-.*:y'qfa _1 1
1.5708
   3 :'%:-.*:y'qfa _1 1-0.5p1
_1.21357e_9
   3 :'%:-.*:y'qfa _1 1 20-0.5p1
_1.04805e_13
   3 :'%:-.*:y'qfa _1 1 20 1e_15-0.5p1
_3.70814e_14
   f=:3 :'(1+^y)%(y+^y)'
   F=:3 :'^.y+^y'
   f qfa ''-(F 1)-F 0
   f=:3 :'(_1 o. y)%%:-.*:y'
   F=:3 :'-:*:_1 o. y'
   f qfa 0 0.5-(F 0.5)-F 0
   3 :'(y*1 o.y)%(>:*:2 o.y)'qfa 0 1p1 - 0.5p1*3 :'(1 o.y)%(>:*:2 o.y)'qfa 0 1p1
   F=:3 :'_0.5p1*_3 o.2 o.y'
   3 :'(y*1 o.y)%(>:*:2 o.y)'qfa 0 1p1 - (F 1p1)-F 0
   +qqfa''-1
   (++*)qqfa''-5r4
   (+**)qqfa''-1r3
   (***)qqfa''-1r9

   3 :'(%:y)*^.y'qfa''-_4r9
2.68735e_9
   3 :'(%:y)*^.y'qfa 0 1 30 1e_16-_4r9
0
   3 :'%:-.*:y'qfa''-0.25p1
_2.1453e_10
   3 :'%:-.*:y'qfa 0 1 30 1e_16-0.25p1
0
   3 :'%:3 o.y'qfa 0 0.5p1-0.5p1*%:2
125.179
   3 :'%:3 o.y'qfa 0 0.5p1 40 1e_16-0.5p1*%:2
4.5533e_8
   3 :'^--:*:y'qfa 0 10-%:0.5p1
2.22045e_16
   3 :'(^-y)*2 o.y'qfa 0 100-0.5
0
   3 :'(^-y)*2 o.id y'qfa 0 _-0.5
0
  3 :'(*:y)*_3 o.y'qfa''-(12%~1p1+_2+2*^.2)
_2.77556e_17
   3 :'(^y)*2 o.y'qfa 0 0.5p1-(-:_1+^0.5p1)
2.22045e_16
   3 :'(_3 o.%:2+*:y)%((>:*:y)*%:2+*:y)'qfa''-5p2%96
0
   3 :'id (%:y)%%:-.*:y'qfa 0 1 40 1e_16-2*(%:1p1)*(!_1+3r4)%(!_1+1r4)
_3.99452e_8
   3 :'(^y)*2 o.y'qfa 0 0.5p1--:<:^0.5p1
2.22045e_16
   3 :'^.2 o.y'qfa 0 0.5p1 40 1e_16-(_0.5p1*^.2)
1.33227e_15
   3 :'id *:^.y'qfa 0 1 60 1e_16-2
_2.22045e_16
   _1p1+4*(3 :'%%:-.*:y')qfa (0,%:0.5)
4.44089e_16
   4 :'^-1p1*(*:x)+(*:y)'qqfa __ _ __ _-1
0
   4 :'%>:x*y'qqfa 0 1 0 1-1r12p2
2.22045e_16
   clear''
)
