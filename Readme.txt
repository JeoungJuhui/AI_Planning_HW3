B877033 JJH 2021 GAMEAI HW3 Planning - red

---------------------------------------
구현 도메인

1. meet(?person1 ?person2 ?loc)
조건: person1과 person2가 같은 장소에 있다.
결과: person1과 person2가 마주쳤다는 것을 확인한다.

2. eat-alive(?person1 ?person2)
조건: 
person1이 포식자다.
person1과 person2가 만났다.
person2는 식물이 아니다.
person2는 이미 먹히지 않았다.
person1과 person2는 다른 사람이다.
결과: 
person2는 person1 안에 있다.

3. sleep(?person1 ?person2 ?person3)
조건: person1 은 포식자이고 personc2와 person3을 삼켰다. person2와 person3은 같은 사람이 아니다.
결과: person1은 잠을 잔다.

4. kill(?person1 ?person2 ?obj)
조건: person1과 person2가 만났을 때 person1은 자고 있다. person2 에게는 무기가 있고 둘은 다른 사람이다. 
person2는 person1에게 먹힌 상태가 아니다.
결과: 포식자가 죽었다, person1은 더이상 포식자가 아니다.

5. save(?person1 ?person2 ?person3 ?weapon)
조건: person1은 포식자가 아니다. person2는 person1 안에 있다. person3은 무기를 가지고 있고 먹힌 상태가 아니다.
결과: person2는 pc1 안에 있지 않다.

6. tell(?person1 ?person2 ?info ?obj)
조건: person1과 person2가 만났다. person2는 obj를 가지고 있다. 두 사람은 다른 사람이다. 
결과: person2는 정보를 얻게 된다. 두 사람은 만난 상태가 아니다.

7. pick-flowers(?person1 ?info ?obj ?loc)
조건: person1은 정보를 가지고 있다. 정보는 loc에 있고 person1도 loc에 있다. person1은 obj를 가지고 있다.
결과: obj 안에 info를 넣는다.

-------------------------------------
문제 파일 설명

- red1
목표: 바구니 안에 꽃이 있다.
과정: red가 woods로 이동해 wolf를 만나 꽃에 대한 정보를 듣고 꽃을 꺾어 바구니에 넣는다.

-red2
목표: 1에 이어서 wolf가 red와 granny를 잡아먹고 잠에 든다.
과정: wolf가 granny를 먼저 잡아먹고 red를 잡아먹고 잔다.
문제: wolf가 woods에서 red를 먼저 잡아먹는다.

-red3
목표: 늑대가 죽는다.
과정: 늑대가 잠들면 hunter가 grannyhome으로 와 늑대를 죽인다.

-red-final
목표: 최종 스토리 구현
문제: 전체적으로 스토리와 유사하게 움직이나 hunter가 grannyhome에 red보다 먼저 도착한다. 

-------------------------------------------
수정사항 및 어려웠던 점

처음 구현시 state를 이용해 변수를 추가하고 eaten, die, sleep 등을 직접 domain에 입력해 스토리를 구현했습니다.
그러나 domain에 직접 상태를 입력해 지정해주는 부분이 마음에 들지 않아 도중에 모두 수정하다 보니 시간이 부족해 구현이 미흡한 점이 아쉽습니다.

hunter의 초기 위치인 hut을 추가했습니다.
최초 파일에서의 give는 포식자의 생존을 표시하는 상태를 추가해 포식자가 죽은 뒤, red가 granny에게 바구니를 건네는 방식으로 변경했습니다.

행동트리 이미지는 변수와 상태가 많아 생성되지 않는 오류가 있어 첨부하지 못했습니다.
또한 마찬가지로 Web Planner에서 변수가 많아 최종 파일이 실행되지 않는 오류가 있어 PDDL Editor을 이용해 작업하였습니다.












