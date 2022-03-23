###2주차 iOS 스터디 준비

##AutoLayout
##Constraint
##Inspector
##SuperView vs SafeArea

#AutoLayout이란?
자동 레이아웃은 뷰에 설정된 제약(Constanit)을 기반으로 뷰 계층에 있는 모든 뷰의 크기와 위치를 동적으로 계산합니다.
기기의 화면 크기가 다양하기 때문에 모든 기기에 공통적으로 적용 할 수 있는 방법.

#Constraint (제약)
AutoLayout을 사용할때 view나 객체들의 좌표 또는 위치, 비율등에대한 조건을 미리 설정하는것
swift가 위치, 크기, 비율등을 추론 할 수 있게만 설정하면 된다.
에디터 영역과 디버그영역 사이에 오른쪽에 보면 add constraints를 할 수 있다.
바로 왼쪽버튼(정렬)으로도 적용이 가능하다.

#Inspector
세부 요소(속성) 값을 설정 할 수 있다.
ex) 비율, 이미지, 배경색, 등등

#SuperView
hierarchy 가 있는 뷰에서 상위 뷰를 지칭

#Safe Area
앱 실행시 상태바, 내비게이션 바, 탭바, 노치 등에 의해 가려지지 않는 안전한 영역
