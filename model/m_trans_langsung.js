const mysql             = require('mysql2')
const config_database   = require('../config/database')
const moment            = require('moment')
const db                = config_database.db
const eksekusi          = config_database.eksekusi
module.exports =
{
    getDetailProduk_diKeranjang: function(req) {
        let sqlSyntax = mysql.format(
            `SELECT
                krj.*,
                pro.nama as produk_nama, pro.harga, pro.stok, pro.foto1
            FROM trans_keranjang as krj
            LEFT JOIN master_produk as pro ON pro.id = krj.id_produk
            WHERE id_user = ?`,
            [req.session.user[0].id]
        )
        return eksekusi( sqlSyntax )
    },
}
