UPDATE PUB_ERR_CODE SET PEC_SHOWMSG = '�����ļ�ʧ��', PEC_INNERMSG = '�����ļ�ʧ��' where PEC_ERRCODE = 'CMCM073';
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CMIF101', 'CN','������ϸ��ѯʧ�ܣ����Ժ����Ի���ϵ��������', '������ϸ��ѯʧ�ܣ����Ժ����Ի���ϵ��������', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CMIF100', 'CN','ϵͳ�쳣������ϵ��������', 'ϵͳ�쳣������ϵ��������', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CCCCCCC', 'CN','ϵͳ�����У����Ժ�����', 'ϵͳ�����У����Ժ�����', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CMIF102', 'CN','������ϸ��ѯ�쳣�����Ժ�����', '������ϸ��ѯ�쳣�����Ժ�����', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CMIF103', 'CN','������ϸ��ѯ�����쳣������ϵ��������', '������ϸ��ѯ�����쳣������ϵ��������', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('CMIF104', 'CN','��������ʧ��', '��������ʧ��', '0','0');




UPDATE PUB_ERR_CODE SET PEC_SHOWMSG = '�����ļ�ʧ��', PEC_INNERMSG = '�����ļ�ʧ��' where PEC_ERRCODE = 'CMCM073';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CMIF101';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CMIF100';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CCCCCCC';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CMIF102';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CMIF103';
delete from PUB_ERR_CODE where PEC_ERRCODE = 'CMIF104';

