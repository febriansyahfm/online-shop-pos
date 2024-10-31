const m_user = require('../model/m_user')
const bcrypt = require('bcryptjs')

module.exports=
{
    halaman_login: function(req, res){
        if (req.session.user) {
            res.redirect('/toko')
        } else {
            let data = {
                notifikasi: req.query.notif,
    
            }
            res.render('v_auth/login', data)
        }
        
    },
    proses_login: async function(req,res){
        console.log(req.body)
        let form_email = req.body.form_email
        let form_password = req.body.form_password

        let email_exist = await m_user.cari_email(form_email)
        if (email_exist.length > 0) {
            let password_cocok = bcrypt.compareSync(form_password, email_exist[0].password)
            if (password_cocok){
                req.session.user = email_exist
                res.redirect('/olshop')
            }else{
                // tendang ke halaman login
                let pesan = `Password Salah!`
                res.redirect(`/auth/login?notif=${pesan}`)
            }
            //cek password
        }else{
            // tendang ke halaman register
            let pesan = `Email belum adat, Silahkan daftar!`
            res.redirect(`/auth/login?notif=${pesan}`)
            
        }
        
    },

    cek_login: function(req, res, next){
        if (req.session.user) {
            next()
        }else{
            let pesan = `Sesi Habis, Silahkan Login Ulang!`
            res.redirect(`/auth/login?notif=${pesan}`)
        }
            // lempar ke halaman login
    },
    proses_logout: function(req,res) {
        req.session.destroy( (err) => {
            res.redirect('/') // will always fire after session is destroyed
        })
    },
    percobaan: function(req,res) {
        let inputpassword   = req.params.inputpassword
        let passwordhashed  = bcrypt.hashSync(inputpassword)
        res.send(
            `<span>inputpassword = ${inputpassword}</span><br>
            <span>passwordhashed = ${passwordhashed}</span><br>`
        )
    },
    
}