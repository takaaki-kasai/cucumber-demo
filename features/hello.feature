# language:ja
機能: テストアプリケーション
  サンプル用のテストアプリケーションの動作確認

  シナリオ: トップページを表示
    もし "トップページ(/)" にアクセスした

    ならば フォームの送信先が "/hello" であり、
    かつ "送信ボタン(#hello_button)" に "Hello!" と表示されていること

  シナリオ: Helloページを表示
    もし "トップページ(/)" にアクセスし、
    かつ "メッセージエリア(#hello_msg_area)" に以下の内容を入力し、
    """
    やあ （´・ω・｀)
    ようこそ、バーボンハウスへ。
    このテキーラはサービスだから、まず飲んで落ち着いて欲しい。
    """
    かつ "送信ボタン(#hello_button)" をクリックした

    ならば "メッセージ表示領域(.hello_message)" に以下の内容が表示されていること
    """
    やあ （´・ω・｀) ようこそ、バーボンハウスへ。 このテキーラはサービスだから、まず飲んで落ち着いて欲しい。
    """

  @javascript
  シナリオ: AJAX
    もし "トップページ(/)" にアクセスした

    ならば "返事(#hello_response)" に "ボタンを押して" と表示されていること

    もし "あいさつボタン(#greetings_button)" をクリックした

    ならば "返事(#hello_response)" に "どうも" と表示されていること(非同期)
