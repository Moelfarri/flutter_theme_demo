import 'package:flutter/material.dart';

//-----------------------------THEME DEFINITION---------------
class ExampleTheme {
  static final ThemeData lightTheme = ThemeData(
    //Either define a colorScheme or a colorSchemeSeed
    /*colorScheme: ColorScheme(
      brightness: Brightness.light,

      //Primary colors: info, most dominant UI, buttons, active states, tint of elevated surfaces
      primary:  Some color from the Color class,
      onPrimary:  Some color from the Color class,
      primaryContainer:  Some color from the Color class,
      onPrimaryContainer:  Some color from the Color class,

      //Secondary colors: less prominent components in the UI, filter chips/tags,
      secondary:  Some color from the Color class,
      onSecondary:  Some color from the Color class,
      secondaryContainer:  Some color from the Color class,
      onSecondaryContainer:  Some color from the Color class,

      //Tertiary colors: used to contrasting accents used to balance primary and secondary colors
      //or bring heightened attention to a specific UI element. Here a design team is left
      //to derive a good tertiary color profile that supports broader color expression in the product.
      tertiary:  Some color from the Color class,
      onTertiary:  Some color from the Color class,
      tertiaryContainer:  Some color from the Color class,
      onTertiaryContainer:  Some color from the Color class,

      //Error colors
      error:  Some color from the Color class,
      onError:  Some color from the Color class,
      errorContainer: Some color from the Color class,
      onErrorContainer:  Some color from the Color class,

      //Neutral colors
      background:  Some color from the Color class,
      onBackground:  Some color from the Color class,
      surface:  Some color from the Color class,
      onSurface:  Some color from the Color class,

      //variants
      surfaceVariant:  Some color from the Color class,
      onSurfaceVariant:  Some color from the Color class,

      //outline shadows
      outline:  Some color from the Color class,
      shadow:  Some color from the Color class,

      //inverse
      inversePrimary: Some color from the Color class,
      inverseSurface:  Some color from the Color class,
      onInverseSurface: Some color from the Color class,
      surfaceTint:  Some color from the Color class,
    ),*/
    //comment out brightness and colorSchemeSeed if you uncomment colorScheme
    brightness: Brightness.light, //light theme
    colorSchemeSeed:
        Colors.blue, //define your primary color and Flutter generates the rest
    useMaterial3: true,
  );

  //simplifying dark theme by using main light theme color as reference
  static final ThemeData darkTheme = ThemeData(
    colorSchemeSeed:
        Colors.blue, //define your primary color and Flutter generates the rest
    brightness: Brightness.dark, //dark theme
    useMaterial3: true,
  );
}

//adding additional/custom colors to the colorScheme if you need to add more to the color class
extension AdditionalColors on ColorScheme {
  //extra color definitions colors (other properties also possible)
  Color get extraColor => brightness == Brightness.light
      ? Colors.lime //light theme
      : Colors.white; //dark theme
  Color get onExtraColor =>
      brightness == Brightness.light ? Colors.white : Colors.lime;
}
//-----------------------------THEME DEFINITION---------------

//-----------------------------POINT OF ENTRY---------------
void main() {
  runApp(const MyApp());
}
//-----------------------------POINT OF ENTRY---------------

//-------------------------ROOT WIDGET OF APP--------------
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override //build method runs everytime a state changes.
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ExampleTheme.lightTheme, //light Theme defined here
      darkTheme: ExampleTheme.darkTheme, //dark theme defined here
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Demo'),
        ),
        body: const MyHomePage(),
      ),
    );
  }
}
//-------------------------ROOT WIDGET OF APP--------------

//-------------------------DEMO CONTENT--------------
//widget right under the MyApp root widget
//usually you'll move widgets, themes, etc to their own files and folders
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //example button 1
          /*Flutter automatically uses onPrimary color for the backgronud the
             Elevatedbutton class and primary for the content inside it, see 
             example button 2 and 3 for how to override the colors*/
          ElevatedButton(
            onPressed: () {},
            child: const Text('Default Color on Button'),
          ),

          //example button 2
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              //define the button background color using the colorScheme we defined for the app
              primary: Theme.of(context).colorScheme.tertiary,
            ),
            child: Text(
              'Use Tertiary colors from our ColorScheme',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onTertiary,
              ),
            ),
          ),
          //example button 3
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              //define the button background color using the AdditionalColors added to our colorScheme
              primary: Theme.of(context).colorScheme.extraColor,
            ),
            child: Text(
              'Use AdditionalColors added to the ColorScheme',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 //-------------------------DEMO CONTENT--------------
