
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA011'	,'CN', '��ݿ�ʼ�ղ���С��Э����ʼ�ջ�����Ϣ�ղ���С�ڷſʼ�ջ�Э����ö�Ȳ���С�ڱ��ηſ���','��ݿ�ʼ�ղ���С��Э����ʼ�ջ�����Ϣ�ղ���С�ڷſʼ�ջ�Э����ö�Ȳ���С�ڱ��ηſ���','0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA014'	,'CN', '���׽��ӦС�ڵ���ʵ�ʿ��ö��','���׽��ӦС�ڵ���ʵ�ʿ��ö��','0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA019'	,'CN', '�ſ���ܴ���ʵ�ʿ��ö�Ȼ���Ϣ�ղ��ܴ��ڽ�ݵ����ջ��ݵ����ղ��ܴ���Э�鵽����','�ſ���ܴ���ʵ�ʿ��ö�Ȼ���Ϣ�ղ��ܴ��ڽ�ݵ����ջ��ݵ����ղ��ܴ���Э�鵽����','0','0');

update PUB_ERR_CODE set PEC_SHOWMSG='��ݿ�ʼ�ղ���С��Э����ʼ�ջ�����Ϣ�ղ���С�ڷſʼ�ջ�Э����ö�Ȳ���С�ڱ��ηſ���',PEC_INNERMSG='��ݿ�ʼ�ղ���С��Э����ʼ�ջ�����Ϣ�ղ���С�ڷſʼ�ջ�Э����ö�Ȳ���С�ڱ��ηſ���' where PEC_ERRCODE = 'LNRA011';
update PUB_ERR_CODE set PEC_SHOWMSG='���׽��ӦС�ڵ���ʵ�ʿ��ö��',PEC_INNERMSG='���׽��ӦС�ڵ���ʵ�ʿ��ö��' where PEC_ERRCODE = 'LNRA014';
update PUB_ERR_CODE set PEC_SHOWMSG='�ſ���ܴ���ʵ�ʿ��ö�Ȼ���Ϣ�ղ��ܴ��ڽ�ݵ����ջ��ݵ����ղ��ܴ���Э�鵽����',PEC_INNERMSG='�ſ���ܴ���ʵ�ʿ��ö�Ȼ���Ϣ�ղ��ܴ��ڽ�ݵ����ջ��ݵ����ղ��ܴ���Э�鵽����' where PEC_ERRCODE = 'LNRA019';
