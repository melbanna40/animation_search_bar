# animation_search_bar

A Customizable Animated Search Bar. It is suitable for the AppBar.

<a href="https://pub.dev/packages/animation_search_bar"><img src="https://img.shields.io/pub/v/animation_search_bar.svg" alt="Pub"></a>
<a href="https://pub.dev/packages/animation_search_bar/score"><img src="https://img.shields.io/pub/likes/animation_search_bar?logo=flutter" alt="Pub likes"></a>
<a href="https://pub.dev/packages/animation_search_bar/score"><img src="https://img.shields.io/pub/popularity/animation_search_bar?logo=flutter" alt="Pub popularity"></a>
<a href="https://pub.dev/packages/animation_search_bar/score"><img src="https://img.shields.io/pub/points/animation_search_bar?logo=flutter" alt="Pub points"></a>

## Getting Started

### Simple use case
```dart
AnimationSearchBar
(
backIconColor: Colors.black,
title:Text('Animation Search Bar',
style: TextStyle(
color: Colors.white,
fontSize: 20,
)),
onChanged: (text) => debugPrint(text),
)
```
| Simple use case | Using all properties | 
|:-------------:|:-------------:|
| ![Untitled video ‐ Made with Clipchamp](https://user-images.githubusercontent.com/76734056/163029017-a0ed4266-d4ce-4d23-9121-3aa6c414a171.gif) | ![Dark ‐ Made with Clipchamp](https://user-images.githubusercontent.com/76734056/163030808-c9a4ed63-ce36-4b1a-9945-65cb1e18d93b.gif) |

### All properties of this package
```dart
AnimationSearchBar
(
padding: const EdgeInsets.symmetric(horizontal: 5),
hintStyle: const TextStyle(
color: Colors.white,
),
title: const Row(
children: [
Icon(
Icons.waving_hand_sharp,
color: Colors.white,
),
SizedBox(
width: 4,
),
Text('Animation Search Bar',
style: TextStyle(
color: Colors.white,
fontSize: 20,
)),
],
),
onChanged: (text) {},
iconsColor: Colors.black.withOpacity(0.7)
,
)
,
```

#### Background Color

If you want to customize the background color. Please see the example where I decorate a Container for the search bar background. you can decorate as your wish.



 
