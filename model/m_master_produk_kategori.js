const mysql = require('mysql2')
const config_database = require('../config/database')
const db = config_database.db
const eksekusi = config_database.eksekusi


module.exports = 
{
    getSemua: function (){
        let sqlSyntax = mysql.format(
            `select * from master_produk_kategori`
            
        )
        return eksekusi(sqlSyntax)
    },
    getProdukKategori: function(id_kategori) {
        let sqlSyntax = mysql.format(
            `
            select p.*, k.nama as kategori_nama 
            FROM master_produk as p
            LEFT JOIN master_produk_kategori as k ON k.id = p.kategori_id
            WHERE p.kategori_id = ?;`,
            [id_kategori]
        )
        console.log(id_kategori)
        return eksekusi( sqlSyntax )
        
    },
    getSatuKategori: function (id_kategori){
        let sqlSyntax = mysql.format(
            `select * from master_produk_kategori where id = ?`,
            [id_kategori]
            
        )
        return eksekusi(sqlSyntax)
    },
}