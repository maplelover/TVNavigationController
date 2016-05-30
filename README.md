# TVNavigationController
控制导航栏样式，支持默认、透明、自定义导航栏

实现原理：
在UINavigationController执行Push/Pop过程中，可通过transitionCoordinator跟踪动画的开始与完成时机，普通动画转场或者交互转场都同样可以实现。
找好时机后，根据顶部视图控制器调整导航栏样式。

欢迎拍砖！
