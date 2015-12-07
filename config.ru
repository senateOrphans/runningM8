require 'sinatra/base'

require('./controllers/application')

require('./controllers/account')
require('./controllers/setting')
require('./controllers/tracker')

require('./models/account')
require('./models/setting')
require('./models/tracker')

map('/') { run AccountController }
map('/setting') { run SettingController }
map('/tracker') { run TrackerController }
