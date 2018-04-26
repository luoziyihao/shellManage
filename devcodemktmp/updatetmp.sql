--电子委贷放款管理失败原因查询优化
update PUB_ERR_CODE set PEC_SHOWMSG='借据开始日不能小于协议起始日或借据起息日不能小于放款开始日或协议可用额度不能小于本次放款金额',PEC_INNERMSG='借据开始日不能小于协议起始日或借据起息日不能小于放款开始日或协议可用额度不能小于本次放款金额' where PEC_ERRCODE = 'LNRA011';
update PUB_ERR_CODE set PEC_SHOWMSG='交易金额应小于等于实际可用额度',PEC_INNERMSG='交易金额应小于等于实际可用额度' where PEC_ERRCODE = 'LNRA014';
update PUB_ERR_CODE set PEC_SHOWMSG='放款金额不能大于实际可用额度或起息日不能大于借据到期日或借据到期日不能大于协议到期日',PEC_INNERMSG='放款金额不能大于实际可用额度或起息日不能大于借据到期日或借据到期日不能大于协议到期日' where PEC_ERRCODE = 'LNRA019';

--电子委贷新增错误码
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA224', 'CN','无可结息记录', '无可结息记录', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA894', 'CN','同一票号不应存在多条有效借据', '同一票号不应存在多条有效借据', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA895', 'CN','自助储蓄国债质押不允许调增自助额度', '自助储蓄国债质押不允许调增自助额度', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA896', 'CN','押品种类与担保细类不一致', '押品种类与担保细类不一致', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA897', 'CN','专用金额&1小于可用专用金额&2，不允许做此交易', '专用金额&1小于可用专用金额&2，不允许做此交易', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA898', 'CN','共享金额&1小于可用共享金额&2，不允许做此交易', '共享金额&1小于可用共享金额&2，不允许做此交易', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA899', 'CN','录入凭证号码&1与后台查询凭证号码&2不一致', '录入凭证号码&1与后台查询凭证号码&2不一致', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA900', 'CN','质押账号储种不为整存整取或存本取息,不允许质押', '质押账号储种不为整存整取或存本取息,不允许质押', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA901', 'CN','质押账号介质不为&1,不允许质押', '质押账号介质不为&1,不允许质押', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA902', 'CN','此票据&1无符合卖出条件的有效借据', '此票据&1无符合卖出条件的有效借据', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA903', 'CN','未生成交易日志号', '未生成交易日志号', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA904', 'CN','检索电子指令登记簿出错', '检索电子指令登记簿出错', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA905', 'CN','无此业务场景', '无此业务场景', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA906', 'CN','该协议下借据存在欠还,不能取消停息.', '该协议下借据存在欠还,不能取消停息.', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA907', 'CN','票据&1无符合到期返售条件的有效借据', '票据&1无符合到期返售条件的有效借据', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA908', 'CN','若有欠还时，不允许佣金扣收', '若有欠还时，不允许佣金扣收', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA909', 'CN','该借据不自动转逾期', '该借据不自动转逾期', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA910', 'CN','预收息或核销借据不转逾期', '预收息或核销借据不转逾期', '0','0');
