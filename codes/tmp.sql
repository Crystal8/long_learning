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
