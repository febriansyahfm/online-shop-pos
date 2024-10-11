const express = require('express')
const app = express()
const port = 3000
const cookieParser = require('cookie-parser')
const session = require('express-session')

const c_beranda = require('./controller/c_beranda')
const c_auth = require('./controller/c_auth')
const c_toko = require('./controller/c_toko')
const cek_login = c_auth.cek_login
// setting untuk data session login 
app.use(cookieParser('secret'))
app.use( session({
    secret: 'Rahasia',
    resave: true,
    saveUninitialized: false,
    cookie: {
        maxAge: (1000 * 60) * 30
        //  batas session expires
        //  1000 milidetik * 60 = 1 menit
        //  1 menit * 60 = 1 jam
    }
}))

app.use(express.urlencoded({extended:false}))
app.set('view engine', 'ejs')
app.set('views', './view')
app.use(express.static('public'))

app.get('/',c_beranda.halaman_awal)
app.get('/auth/login', c_auth.halaman_login)
app.post('/auth/proses-login', c_auth.proses_login)
app.get('/toko', cek_login, c_toko.index)

app.listen(port, ()=>{
    console.log('Server sudah up//localhost:',port)
})