--����ί���ſ����ʧ��ԭ���ѯ�Ż�
update PUB_ERR_CODE set PEC_SHOWMSG='��ݿ�ʼ�ղ���С��Э����ʼ�ջ�����Ϣ�ղ���С�ڷſʼ�ջ�Э����ö�Ȳ���С�ڱ��ηſ���',PEC_INNERMSG='��ݿ�ʼ�ղ���С��Э����ʼ�ջ�����Ϣ�ղ���С�ڷſʼ�ջ�Э����ö�Ȳ���С�ڱ��ηſ���' where PEC_ERRCODE = 'LNRA011';
update PUB_ERR_CODE set PEC_SHOWMSG='���׽��ӦС�ڵ���ʵ�ʿ��ö��',PEC_INNERMSG='���׽��ӦС�ڵ���ʵ�ʿ��ö��' where PEC_ERRCODE = 'LNRA014';
update PUB_ERR_CODE set PEC_SHOWMSG='�ſ���ܴ���ʵ�ʿ��ö�Ȼ���Ϣ�ղ��ܴ��ڽ�ݵ����ջ��ݵ����ղ��ܴ���Э�鵽����',PEC_INNERMSG='�ſ���ܴ���ʵ�ʿ��ö�Ȼ���Ϣ�ղ��ܴ��ڽ�ݵ����ջ��ݵ����ղ��ܴ���Э�鵽����' where PEC_ERRCODE = 'LNRA019';

--����ί������������
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA224', 'CN','�޿ɽ�Ϣ��¼', '�޿ɽ�Ϣ��¼', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA894', 'CN','ͬһƱ�Ų�Ӧ���ڶ�����Ч���', 'ͬһƱ�Ų�Ӧ���ڶ�����Ч���', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA895', 'CN','���������ծ��Ѻ����������������', '���������ծ��Ѻ����������������', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA896', 'CN','ѺƷ�����뵣��ϸ�಻һ��', 'ѺƷ�����뵣��ϸ�಻һ��', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA897', 'CN','ר�ý��&1С�ڿ���ר�ý��&2�����������˽���', 'ר�ý��&1С�ڿ���ר�ý��&2�����������˽���', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA898', 'CN','������&1С�ڿ��ù�����&2�����������˽���', '������&1С�ڿ��ù�����&2�����������˽���', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA899', 'CN','¼��ƾ֤����&1���̨��ѯƾ֤����&2��һ��', '¼��ƾ֤����&1���̨��ѯƾ֤����&2��һ��', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA900', 'CN','��Ѻ�˺Ŵ��ֲ�Ϊ������ȡ��汾ȡϢ,��������Ѻ', '��Ѻ�˺Ŵ��ֲ�Ϊ������ȡ��汾ȡϢ,��������Ѻ', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA901', 'CN','��Ѻ�˺Ž��ʲ�Ϊ&1,��������Ѻ', '��Ѻ�˺Ž��ʲ�Ϊ&1,��������Ѻ', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA902', 'CN','��Ʊ��&1�޷���������������Ч���', '��Ʊ��&1�޷���������������Ч���', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA903', 'CN','δ���ɽ�����־��', 'δ���ɽ�����־��', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA904', 'CN','��������ָ��Ǽǲ�����', '��������ָ��Ǽǲ�����', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA905', 'CN','�޴�ҵ�񳡾�', '�޴�ҵ�񳡾�', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA906', 'CN','��Э���½�ݴ���Ƿ��,����ȡ��ͣϢ.', '��Э���½�ݴ���Ƿ��,����ȡ��ͣϢ.', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA907', 'CN','Ʊ��&1�޷��ϵ��ڷ�����������Ч���', 'Ʊ��&1�޷��ϵ��ڷ�����������Ч���', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA908', 'CN','����Ƿ��ʱ��������Ӷ�����', '����Ƿ��ʱ��������Ӷ�����', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA909', 'CN','�ý�ݲ��Զ�ת����', '�ý�ݲ��Զ�ת����', '0','0');
insert into PUB_ERR_CODE (PEC_ERRCODE,PEC_LANGUAGE,PEC_SHOWMSG,PEC_INNERMSG,PEC_CLASS,STT) values('LNRA910', 'CN','Ԥ��Ϣ�������ݲ�ת����', 'Ԥ��Ϣ�������ݲ�ת����', '0','0');
