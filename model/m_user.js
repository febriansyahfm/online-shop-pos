const mysql = require('mysql2')
const config_database = require('../config/database')
const db = config_database.db
const eksekusi = config_database.eksekusi


module.exports = 
{
    cari_email: function (form_email){
        let sqlSyntax = mysql.format(
            `select * from user where email = ?`,
            [form_email]
        )
        return eksekusi(sqlSyntax)
    },
    cariProfil: function (id_profil){
        let sqlSyntax = mysql.format(
            `select id, email,  password, nama_lengkap, role_id, date_format(created_at,"%d-%m-%Y %T") as created_at from user where id = ?`,
            [id_profil]
        )
        return eksekusi(sqlSyntax)
    }
}