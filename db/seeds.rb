admin = Admin.create(
  email: 'admin@test.com',
  first_name: "Admin",
  last_name: "Test",
  password: 'foobar',
  password_confirmation: 'foobar',
  confirmed_at: Time.zone.now
)

backend = Category.create(title: 'Backend')
frontend = Category.create(title: 'Frontend')

ruby = backend.tests.create(title: 'Ruby', level: 2, author: admin)
go = backend.tests.create(title: 'Go', level: 3, author: admin)
elixir = backend.tests.create(title: 'Elixir', level: 3, author: admin)
html = frontend.tests.create(title: 'HTML', level: 1, author: admin)
js = frontend.tests.create(title: 'JS', level: 2, author: admin)

ruby_question1 = ruby.questions.create(body: 'What is a difference between class and module?')
ruby_question2 = ruby.questions.create(body: 'What is a Rubocop?')
go_question = go.questions.create(body: 'What is a goroutine?')
elixir_question = elixir.questions.create(body: 'What virtual machine Elixir uses?')
html_question = html.questions.create(body: 'Is <html> tag necessary on every web page?')
js_question = js.questions.create(body: 'What Is DOM in meaning of data structures?')

ruby_question1.answers.create([
                               {body: 'There is no possibility to create module instance', correct: true},
                               {body: 'There is no possibility to create class instance', correct: false}
                             ])
ruby_question2.answers.create([
                                {body: 'HTTP client', correct: false},
                                {body: 'Linter', correct: true}
                              ])
go_question.answers.create([
                               {body: 'Lightweight thread managed by the Go runtime', correct: true},
                               {body: 'A typed conduit through which you can send and receive values', correct: false}
                             ])
elixir_question.answers.create([
                             {body: 'JVM', correct: false},
                             {body: 'Erlang (BEAM)', correct: true}
                           ])
html_question.answers.create([
                                 {body: 'Yes', correct: true},
                                 {body: 'No', correct: false}
                               ])
js_question.answers.create([
                               {body: 'Hash', correct: false},
                               {body: 'Tree', correct: true}
                             ])
