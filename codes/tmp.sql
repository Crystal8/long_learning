-- story PGC个人帐号表
create table `t_qqstory_pgc_personal_account`
(
    `f_qq` int(11) unsigned NOT NULL, /* 绑定QQ号 */
    `f_nickname` varchar(64) NOT NULL, /* 昵称 */
    `f_authenticate_content` varchar(1024), /* 认证内容 */
    `f_phone` varchar(32) NOT NULL, /* 手机 */
    `f_partner_type` int(1) NOT NULL , /* 合作方类型：1（普通）2（now） */
    `f_apply_time` int(11) unsigned,  /* 提交申请时间 */
    `f_audit_time` int(11) unsigned,  /* 审核通过时间 */
    `f_recommand_state` int(1)  NOT NULL, /* 推荐状态: 0（否）1（是） */
    `f_audit_state` int(1)  NOT NULL, /* 帐号状态：0（审核中） 1（审核通过） 2（审核失败）*/
    `f_update_time` int(11) unsigned, /* 更新时间 */
    `f_is_online` int(1) NOT NULL, /* 上下架：0（下架） 1（上架）*/ 
    PRIMARY KEY(`f_qq`),
    KEY `f_nickname`  (`f_nickname`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO t_qqstory_pgc_personal_account (f_qq, f_nickname, f_audit_state, f_is_online)
VALUES
(1, 'lisnevs1', 0, 0),
(2, 'lisnevs2', 2, 0),
(3, 'lisnevs3', 1, 0),
(4, 'lisnevs4', 0, 1),
(5, 'lisnevs5', 2, 1),
(6, 'lisnevs6', 1, 1),
(7, 'lisnevs7', 1, 1),
(8, 'lisnevs8', 1, 1),
(9, 'lisnevs9', 1, 1),
(10, 'lisnevs10', 1, 1),
(11, 'ivensli', 0, 0),
(12, 'ivensli', 2, 0),
(13, 'ivensli', 1, 0),
(14, 'ivensli', 0, 1),
(15, 'ivensli', 2, 1),
(16, 'ivensli', 1, 1),
(17, 'ivensli', 1, 1),
(18, 'ivensli', 1, 1),
(19, 'ivensli', 1, 1),
(20, 'ivensli', 1, 1),
(21, 'pre_ivensli01', 0, 0),
(22, 'pre_ivensli02', 2, 0),
(23, 'pre_ivensli03', 1, 0),
(24, 'pre_ivensli04', 0, 1),
(25, 'pre_ivensli05', 2, 1),
(26, 'pre_ivensli06', 1, 1),
(27, 'pre_ivensli07', 1, 1),
(28, 'pre_ivensli08', 1, 1),
(29, 'pre_ivensli09', 1, 1),
(30, 'pre_ivensli10', 1, 1)
