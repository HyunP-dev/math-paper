#set page("a4", margin: 2cm)
#set text(font: "NanumMyeongjo", size: 10pt)
#set par(leading: 1em)

#show heading.where(level: 1): set text(size: 16pt)
#show heading.where(level: 2): set text(size: 12pt)
#show heading.where(level: 3): set text(size: 10pt)
#show heading.where(level: 4): set text(size: 9pt)

#show heading.where(level: 2): set block(below: 12pt, above: 18pt)
#show heading.where(level: 3): set block(below: 10pt, above: 16pt)
#show heading.where(level: 4): set block(below: 9pt, above: 16pt)


#set page(
  columns: 2,
  background: {
    place(center, line(
      angle: 90deg,
      length: 95%,
      stroke: (paint: black, thickness: 0.6pt, dash: "dotted"),
    ))
  },
  header: context {
    let page_num = counter(page).get().first()
    
    if page_num == 1 {
      place(top + center, dy: -30pt, block(width: 120%, height: 120pt, fill: white))
      place(top + center, dy: 30pt, block(width: 120%, height: 70pt, fill: white))
    } else {
      place(top + center, dy: -30pt, block(width: 120%, height: 80pt, fill: white))
    }
  },
)

#set page(
  footer: context {
    stack(
      spacing: 8pt,
      place(center, line(length: 100%, stroke: 0.5pt)),
      align(center, counter(page).display())
    )
  }
)

#place(
  top + center,
  scope: "parent",
  float: true,
  [= 2차 함수와 2차 방정식
    #block(height: 20pt)],
)

== 2차 함수
2차 함수는 다항식으로 이뤄진 함수 중에서도 최고차항의 차수가 2인 함수로
일반적으로 다음과 같은 형태로 표현된다.
$
  f(x) := a x^2 + b x + c space (a, b, c in #sym.RR, a eq.not 0)
$
여기서 $a$의 값에 따라 함수의 그래프 형태가 크게 두 가지의 형태로 나뉜다.

- $a > 0$인 경우: 그래프는 아래로 볼록한 포물선 형태.
- $a < 0$인 경우: 그래프는 위로 볼록한 포물선 형태.

이는 2차 함수의 그래프가 포물선 형태를 갖고 있음을 숙지하고 있으면 그 방향은
충분히 크고 작은 값을 $x$에 대입하여 확인할 수 있다.

=== 2차 함수의 표현식

2차 함수는 식을 방식에 따라 변형함으로써 함수의 그래프 개형을 더욱 파악하기 쉽다.

==== 완전제곱식
$
  (a x + b)^2
$
2차 함수를 완전제곱식으로 묶으면 다음과 같은 꼴로 표현할 수 있다.
$
  f(x) := (a x + b)^2 + m
$
위 식에서 완전제곱식이 0이 되도록 하는 $x$의 값은 $-frac(b, a)$이며
이 때의 함수값은 $m$이 되고 이 $x$값을 기준으로 좌우 대칭임을 알 수 있다.

*증명*

$
  f(-frac(b, a) + k) = f(-frac(b, a) - k) = k^2 + m space (forall k in bb(R))
$

==== 인수분해식
인수분해란 다항식을 더 낮은 차수를 갖는 다항식들의 곱으로 표현하는 것을 말한다.
따라서 2차 함수는 최고차수가 2이기 때문에 인수분해를 하면 두 1차식의 곱으로 나타난 형태를 갖는다.
예로 아래와 같이 두 1차식이 곱해진 식을 보자.
$
  (a_1x + b_1)(a_2x + b_2)
$
이를 전개하면 다음과 같다.
$
  a_1a_2x^2 + (a_1b_2 + a_2b_1)x + b_1b_2
$
이를 역으로 다시 두 1차식으로 곱해진 식으로 변환하는 것이 2차식의 인수분해가 된다.
다시 2차 함수로 돌아가 위의 두 식을 아래와 같이 함수로 써보자.
$
  f(x) & :=a_1a_2x^2 + (a_1b_2 + a_2b_1)x + b_1b_2 \
       & thin = (a_1x + b_1)(a_2x + b_2)
$
위 함수에서 우리는 아래와 같음을 알 수 있다.
$
  f(-frac(b_1, a_1)) = f(-frac(b_2, a_2)) = 0
$
또한 우리는 이를 통해 위의 함수를 그래프로 표현했을 때,
$x=-frac(b_1, a_1)$인 지점과 $x=-frac(b_2, a_2)$인 지점에서
$x$축 $(y=0)$과 만난다는 사실을 알 수 있다.

== 2차 방정식
2차 방정식은 위에서의 2차 함수가 $x$축과 만나는 지점을 찾는 문제로 다음과 같은 꼴을 갖는다.
$
  a x^2 + b x + c = 0
$
이를 푸는 방법은 대표적으로 두 가지의 방식이 있는데 그 중 하나는 위에서 설명한 인수분해와
다른 하나로 근의 공식을 이용하는 방법이 있다.

=== 근의 공식
근의 공식은 위와 같은 일반식을 변형해 얻어낼 수 있는데 그 과정은 다음과 같다.
$
  a x^2 + b x + c = a(x^2 + frac(b, a)x) + c = 0
$
위에서 우측 두 변에서 양변에 $-c$를 더하고 $a$로 나누면 다음과 같다.
$
  x^2 + frac(b, a)x = - frac(c, a)
$
위에서 양변에 $(frac(b, 2a))^2$을 더하면 좌변은 아래와 같이 완전제곱식이 된다.
$
  (x + frac(b, 2a))^2 = - frac(c, a) + (frac(b, 2a))^2
$
위에서 양변에 제곱근을 취하고 양변에 $-frac(b, 2a)$를 더하면 아래와 같은 근의 공식을 얻어낼 수 있다.
$
  x = frac(-b plus.minus sqrt(b^2 - 4 a c), 2a)
$