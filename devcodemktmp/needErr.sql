UPDATE PUB_ERR_CODE SET PEC_SHOWMSG = '下载文件失败', PEC_INNERMSG = '下载文件失败' where PEC_ERRCODE = 'CMCM073';
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CMIF101', 'CN','批量明细查询失败，请稍后重试或联系中信银行', '批量明细查询失败，请稍后重试或联系中信银行', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CMIF100', 'CN','系统异常，请联系中信银行', '系统异常，请联系中信银行', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CCCCCCC', 'CN','系统处理中，请稍后重试', '系统处理中，请稍后重试', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CMIF102', 'CN','批量明细查询异常，请稍后重试', '批量明细查询异常，请稍后重试', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CMIF103', 'CN','批量明细查询数据异常，请联系中信银行', '批量明细查询数据异常，请联系中信银行', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CMIF104', 'CN','批量处理失败', '批量处理失败', '0','0');




UPDATE PUB_ERR_CODE SET PEC_SHOWMSG = '下载文件失败', PEC_INNERMSG = '下载文件失败' where PEC_ERRCODE = 'CMCM073';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CMIF101';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CMIF100';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CCCCCCC';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CMIF102';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CMIF103';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CMIF104';

