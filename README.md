# EasyTextInput

An easy to use, complete text input brought to you by Brainn.co

### Installation

Add this to your pubspec.yaml (or create it):

```yaml
dependencies:
easy_text_input: ^1.0.0
```

Then run the flutter tooling:

```bash
flutter packages get
```

## Demo

![demo](https://github.com/CarlosMion/Gifs-and-Images/blob/master/easyTextInput.gif)

## How to use

You will need a Bloc with a stream to controll the data flowing through the InputField, for a better explanation on how blocs work please check the example folder.

#### Simple Field

```dart
InputField(
              stream: exampleBloc.exampleStream,
              labelText: 'Example',
              onChanged: exampleBloc.sinkExample,
            ),
```

#### Example obscured Field

```dart
InputField(
              stream: exampleBloc.password,
              labelText: 'Password',
              onChanged: exampleBloc.sinkPassword,
              obscureText: true,
              successIcon: _successIcon,
              errorIcon: _errorIcon,
              obscureTextIconOff: EyeIcon.close,
              obscureTextIconOn: EyeIcon.open,
            ),
```

#### Example masked Field

```dart
InputField(
              stream: exampleBloc.phone,
              labelText: 'Phone',
              obscureText: true,
              onChanged: exampleBloc.sinkPhone,
              controller: MaskedTextController(mask: '(00) 00000-00000'),
              hintText: '(31) 91234-5678',
              successIcon: _successIcon,
            ),
```

## Attributes

Customizable attributes for InputField

<table>
    <th>Attribute Name</th>
    <th>Type</th>
    <th>Required</th>
    <th>Default Value</th>
    <th>Example Value</th>
    <th>Description</th>
    <tr>
        <td>stream</td>
        <td>Stream</td>
        <td>true</td>
        <td></td>
        <td>exampleBloc.emailStream</td>
        <td>The stream that controls the data flowing through the InputField Widget</td>
    </tr>
    <tr>
        <td>onChanged</td>
        <td>Function</td>
        <td>true</td>
        <td></td>
        <td>exampleBloc.sinkEmail</td>
        <td>The method that will deal with every change in the value of the focused InputField</td>
    </tr>
    <tr>
        <td>labelText</td>
        <td>String</td>
        <td>false</td>
        <td>''</td>
        <td>'E-mail'</td>
        <td>The Label of the InputField, The information that will float to the top of the InputField when the Widget is focused</td>
    </tr>
    <tr>
        <td>hintText</td>
        <td>String</td>
        <td>false</td>
        <td>''</td>
        <td>'hint@example.com'</td>
        <td>The text that will show only when the InputField is focused, to show an example of how the input should be</td>
    </tr>
    <tr>
        <td>counterText</td>
        <td>String</td>
        <td>false</td>
        <td>''</td>
        <td>'1/6'</td>
        <td>a small text that shows on the inferior right of the field to show the user a additional information, like a number to show the user how many characters he has typed</td>
    </tr>
    <tr>
        <td>obscureText</td>
        <td>bool</td>
        <td>false</td>
        <td></td>
        <td>true</td>
        <td>Controls whether the text should show or be obscured, mainly used for password fields</td>
    </tr>
    <tr>
        <td>controller</td>
        <td>dynamic</td>
        <td>false</td>
        <td></td>
        <td>MaskedTextController(mask: '(00) 00000-00000')</td>
        <td>The prop that will connect to the Flutter's native TextInput controller prop, a commom use for this particular prop is for controlling masks on the Text</td>
    </tr>
    <tr>
        <td>keyboardType</td>
        <td>TextInputType</td>
        <td>false</td>
        <td>TextInputType.text</td>
        <td>TextInputType.number</td>
        <td>Controls the type of the keyboard that will show to the user when the InputField is focused</td>
    </tr>
    <tr>
        <td>maxLength</td>
        <td>int</td>
        <td>false</td>
        <td></td>
        <td>10</td>
        <td>Set the maximum amount of characters the InputField will accept</td>
    </tr>
    <tr>
        <td>errorIcon</td>
        <td>Widget</td>
        <td>false</td>
        <td>const SizedBox.shrink()</td>
        <td>ImageIcon();</td>
        <td>The icon that will show at the end of the InputField showing that the input is invalid</td>
    </tr>
    <tr>
        <td>successIcon</td>
        <td>Widget</td>
        <td>false</td>
        <td>const SizedBox.shrink()</td>
        <td>ImageIcon();</td>
        <td>The icon that will show at the end of the InputField showing that the input is valid</td>
    </tr>
     <tr>
        <td>obscureTextIconOff</td>
        <td>Widget</td>
        <td>false</td>
        <td>const SizedBox.shrink()</td>
        <td>ImageIcon();</td>
        <td>The icon that will show at the end of the InputField showing that the obscureText feature is off</td>
    </tr>
    <tr>
        <td>obscureTextIconOn</td>
        <td>Widget</td>
        <td>false</td>
        <td>const SizedBox.shrink()</td>
        <td>ImageIcon();</td>
        <td>The icon that will show at the end of the InputField showing that the obscureText feature is on</td>
    </tr>
    <tr>
        <td>borderRadius</td>
        <td>double</td>
        <td>false</td>
        <td>8.0</td>
        <td>12.0</td>
        <td>Controls the curvature of the borders of the InputField</td>
    </tr>
    <tr>
        <td>successColor</td>
        <td>aaaaaaaaColoraaaaaaa</td>
        <td>false</td>
        <td>Colors.green</td>
        <td>Colors.blue</td>
        <td>Sets the color that the InputField will be colored with when the input is considered valid</td>
    </tr>
    <tr>
        <td>errorColor</td>
        <td>Color</td>
        <td>false</td>
        <td>Colors.red</td>
        <td>Colors.purple</td>
        <td>Sets the color that the InputField will be colored with when the input is considered invalid</td>
    </tr>
</table>
