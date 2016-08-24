
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA011'	,'CN', '借据开始日不能小于协议起始日或借据起息日不能小于放款开始日或协议可用额度不能小于本次放款金额','借据开始日不能小于协议起始日或借据起息日不能小于放款开始日或协议可用额度不能小于本次放款金额','0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA014'	,'CN', '交易金额应小于等于实际可用额度','交易金额应小于等于实际可用额度','0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA019'	,'CN', '放款金额不能大于实际可用额度或起息日不能大于借据到期日或借据到期日不能大于协议到期日','放款金额不能大于实际可用额度或起息日不能大于借据到期日或借据到期日不能大于协议到期日','0','0');

update PUB_ERR_CODE set PEC_SHOWMSG='借据开始日不能小于协议起始日或借据起息日不能小于放款开始日或协议可用额度不能小于本次放款金额',PEC_INNERMSG='借据开始日不能小于协议起始日或借据起息日不能小于放款开始日或协议可用额度不能小于本次放款金额' where PEC_ERRCODE = 'LNRA011';
update PUB_ERR_CODE set PEC_SHOWMSG='交易金额应小于等于实际可用额度',PEC_INNERMSG='交易金额应小于等于实际可用额度' where PEC_ERRCODE = 'LNRA014';
update PUB_ERR_CODE set PEC_SHOWMSG='放款金额不能大于实际可用额度或起息日不能大于借据到期日或借据到期日不能大于协议到期日',PEC_INNERMSG='放款金额不能大于实际可用额度或起息日不能大于借据到期日或借据到期日不能大于协议到期日' where PEC_ERRCODE = 'LNRA019';
