const express = require('express')
const app = express()
const port = 3000
const cookieParser = require('cookie-parser')
const session = require('express-session')
const fileUpload = require('express-fileupload')
const c_beranda = require('./controller/c_beranda')
const c_auth = require('./controller/c_auth')
const c_toko = require('./controller/c_toko')
const cek_login = c_auth.cek_login
const c_olshop      = require('./controller/c_olshop')
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
app.use( fileUpload() )
app.get('/',c_beranda.halaman_awal)
app.get('/auth/login', c_auth.halaman_login)
app.post('/auth/proses-login', c_auth.proses_login)
app.get('/toko', cek_login, c_toko.index)

app.get('/olshop', cek_login, c_olshop.halaman_beranda)
app.get('/olshop/produk', cek_login, c_olshop.halaman_index_produk)
app.get('/olshop/produk/tambah', cek_login, c_olshop.halaman_form_tambah)
app.post('/olshop/produk/proses-insert', cek_login, c_olshop.proses_insert_produk)
app.get('/olshop/produk/detail/:id_produk', cek_login, c_olshop.detail_produk)
app.get('/olshop/keranjang/input/:id_produk', cek_login, c_olshop.keranjang_input)
app.get('/olshop/keranjang/list', cek_login, c_olshop.keranjang_list)
app.post('/olshop/keranjang/hapus/:id_keranjang', cek_login, c_olshop.keranjang_hapus)
app.post('/olshop/keranjang/bayar', cek_login, c_olshop.keranjang_bayar)
app.post('/auth/logout', cek_login, c_auth.proses_logout)
app.get('/percobaan-hash-password/:inputpassword', c_auth.percobaan)
app.get('/olshop/orderan-masuk/list', cek_login, c_olshop.orderanMasuk_list)
app.post('/olshop/orderan-masuk/kirim-barang/:id_customer', cek_login, c_olshop.orderanMasuk_prosesKirimBarang)



// menambah fitur langung buy 
app.get('/olshop/buy/buy-detail/:id_produk', cek_login, c_olshop.detail_produk_buy)
app.post('/olshop/buy-detail/bayar', cek_login, c_olshop.detail_keranjang_bayar)
app.get('/olshop/produk/kategori/:id_kategori', cek_login, c_olshop.halaman_produk_kategori)
app.post('/olshop/produk/search', cek_login, c_olshop.cariProduk)
app.get('/olshop/produk/profil/:id_profil', cek_login, c_olshop.cariProfil)
app.get('/olshop/produk/history-belanja/:id_profil', cek_login, c_olshop.dataPembelianProduk)
app.post('/olshop/history-belanja/:id_profil/:id_transaksi', cek_login, c_olshop.updateStatus)

app.listen(port, ()=>{
    console.log('Server sudah up//localhost:',port)
})