import 'dart:html';
import '../../tools/base_screen.dart';

class HomePage extends BaseScreen {
  @override
  void build() {
    final navbar = Element.nav();
    navbar.style.backgroundColor = "#8BC34A";
    navbar.style.width = "100%";
    // navbar.style.height="80px";
    navbar.style.padding = "30px";


    final title = HeadingElement.h1();
    title.text = "Note";
    title.style.color = "white";
    title.style.size = "45px";
    title.style.margin = "0";
    title.style.float = "left";
    title.style.paddingRight = "10px";

    final pageTitle = HeadingElement.h1();
    pageTitle.text = "Sign In";
    pageTitle.style.color = "white";
    pageTitle.style.size = "25px";
    pageTitle.style.margin = "0";

    navbar.children = [title, pageTitle];


    final test = HeadingElement.h1();
    test.text = "Home Page";

    document.body!.children.addAll([navbar, test]);
  }
}
