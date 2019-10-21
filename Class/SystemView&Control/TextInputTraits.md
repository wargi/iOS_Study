# Text Input Traits

## 1. Capitalization
- 대소문자 처리 방식을 설정하는 기능으로 4가지로 구분된다.
  1. None: 별도의 처리를 하지 않음
  2. Words: 단어의 첫문자를 대문자로 변경
  3. Sentences: 문장의 첫문자를 대문자로 변경
  4. AllChars: 모든 문자를 대문자로 변경

## 2. Correction

- 자동완성 기능 (잘못된 단어를 입력하였을때 자동으로 제대로 된 단어를 팝업으로 추천)
  1. Default: 기본 값 (Yes와 같다.)
  2. No: Correction을 설정 안함
  3. Yes: Correction을 설정

~~~swift
@IBOutlet weak var inputField: UITextField!

// Correction 코드 설정
// 0: defalut
// 1: No
// 2: Yes
inputField.autocorrectionType = UITextAutocorrectionType(rawValue: 0)
~~~

## 3. Spell Checking
- 스펠 체크 기능 (잘못된 단어를 입력하였을때 자동으로 제대로 된 단어로 변경해주거나 빨간색 밑줄을 표새해준다.)
  1. Default: 기본 값 (Yes와 같다.)
  2. No: Spell Checking을 설정 안함
  3. Yes: Spell Checking 설정

~~~swift
@IBOutlet weak var textView: UITextView!

// Spell Checking 코드 설정
// 0: defalut
// 1: No
// 2: Yes
textView.spellCheckingType = UITextSpellCheckingType(rawValue: 0)
~~~

## 4. Secure Text Entry

- 텍스트 필드 내부에 비밀번호나 민감한 정보를 입력할 때 보안처리를 해주는 기능
- 텍스트 필드 어트뷰트에서 Secure Text Entry 체크박스로 설정 가능 하다.

````swift
@IBOutlet weak var passwordField: UITextField!

// Secure Text Entry 코드 설정
passwordField.isSecureTextEntry = true
````