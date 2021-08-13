
import 'dart:math' as math;
import 'package:flutter/material.dart';

class AnimationDemoView extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return _AnimationState();
  }
}

class _AnimationState extends State<AnimationDemoView>
    with SingleTickerProviderStateMixin {

  static const padding = 16.0;
  late AnimationController controller;
  late Animation<double> left;
  late Animation<Color?> color;

  @override
  void initState() {
    super.initState();
    Future(_initState);
  }

  void _initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000),
        // 注意类定义的 with SingleTickerProviderStateMixin，提供 vsync 最简单的方法
        // 就是继承一个 SingleTickerProviderStateMixin。这里的 vsync 跟 Android 里
        // 的 vsync 类似，用来提供时针滴答，触发动画的更新。
        vsync: this);
    // 我们通过 MediaQuery 获取屏幕宽度
    final mediaQueryData = MediaQuery.of(context);
    final displayWidth = mediaQueryData.size.width;
    debugPrint('width = $displayWidth');
    color = ColorTween(begin: Colors.red,end: Colors.blue).animate(controller);
    left = Tween(begin: padding, end: displayWidth - padding).animate(controller)
      ..addListener(() {
        // 调用 setState 触发他重新 build 一个 Widget。在 build 方法里，我们根据
        // Animatable<T> 的当前值来创建 Widget，达到动画的效果（类似 Android 的属性动画）。
        setState(() {
          // have nothing to do
        });
      })
    // 监听动画状态变化
      ..addStatusListener((status) {
        // 这里我们让动画往复不断执行

        // 一次动画完成
        if (status == AnimationStatus.completed) {
          // 我们让动画反正执行一遍
          controller.reverse();
          // 反着执行的动画结束
        } else if (status == AnimationStatus.dismissed) {
          // 正着重新开始
          controller.forward();
        }
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // 假定一个单位是 24
    final unit = 24.0;
    final marginLeft = left == null ? padding : left.value;
    // 把 marginLeft 单位化
    final unitizedLeft = (marginLeft - padding) / unit;
    final unitizedTop = math.sin(unitizedLeft);
    // unitizedTop + 1 是了把 [-1, 1] 之间的值映射到 [0, 2]
    // (unitizedTop+1) * unit 后把单位化的值转回来
    final marginTop = (unitizedTop + 1) * unit + padding;

    final color = this.color == null ? Colors.red : this.color.value;
    return Container(
      // 我们根据动画的进度设置圆点的位置
      margin: EdgeInsets.only(left: marginLeft, top: marginTop),
      // 画一个小红点
      child: Container(
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(7.5)),
        width: 15.0,
        height: 15.0,
      ),
    );
  }

}