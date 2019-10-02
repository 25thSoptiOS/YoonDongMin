# YoonDongMin


#### First Assignment



* Soptstagram 화면 만들기



1. **UI요소 둥글게 만들기**

```swift
@IBOutlet weak var profileImage: UIImageView!

profileImage.layer.cornerRadius = profileImage.frame.width * 0.5
profileImage.clipsToBounds = true   // true로 설정하게 되면 안의 내용들이 잘리게 된다. 즉, View를 기준으로 																				내용들이 나타난다.
profileImage.layer.masksToBounds = false // 위와 똑같은 내용
```



**실행화면**

<img src="image/firstAssignment2.gif" height="500px"/><img src="image/firstAssignment1.gif" height="500px"/>

​                         <아이폰 8+>                                              <아이폰 11>









