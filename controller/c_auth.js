module.exports=
{
    halaman_login: function(req, res){
        res.render('v_auth/login')
    },
    proses_login: function(req,res){
        console.log(req.body)
        let form_email = req.body.form_email
        let form_password = req.body.form_password

        
    }
}