#include <iostream>
#include <gflags/gflags.h>
#include <glog/logging.h>

#include "sphinxclient.h"

using namespace std;
using namespace Sphinx;

DEFINE_string(sphinx_ip, "localhost", "sphinx ip");
DEFINE_int32(sphinx_port, 23333, "sphinx port");

DEFINE_string(str, "test", "string for search");

int main(int argc, char** argv)
{
	google::ParseCommandLineFlags(&argc, &argv, true);
	google::InitGoogleLogging(argv[0]);
	google::InstallFailureSignalHandler();
	//google::InstallFailureWriter(&PrintStackInfo);
	//set glog args
	FLAGS_logtostderr = true;
	FLAGS_colorlogtostderr = true;

	LOG(INFO) << "Init sphinx client: Sphinx[ip:" << FLAGS_sphinx_ip << " port:" << FLAGS_sphinx_port << "]";
	class ConnectionConfig_t config(FLAGS_sphinx_ip, FLAGS_sphinx_port);
	Client_t * p_client = new Client_t(config);
	if(!p_client){
		LOG(ERROR) << "Sphinx init failed!";
		return -1;
	}

	string strText = "ivensli";
	uint32_t start = 0;
	uint32_t num = 10;

	class SearchConfig_t queryAttr;
	queryAttr.setMatchMode(SPH_MATCH_BOOLEAN);
	queryAttr.setSearchedIndexes("main_i");
	queryAttr.setMaxQueryTime(1000);
	queryAttr.setPaging(start, num);

	Response_t response;
	try
	{
		p_client->query(strText, queryAttr, response);
	}
	catch(const Error_t & e)
	{ 
		if(e.errCode==3)
		{
			LOG(ERROR) << "search result null";
			return 0;
		}
		LOG(ERROR) << "sphinx client error!,errmsg:" << e.what() << ",errcode:" << e.errCode;
		return 0;
	}

	for(vector<ResponseEntry_t>::iterator erit = response.entry.begin(); erit != response.entry.end(); ++erit)
	{
		string content = erit->attribute["text"];
		string rid = erit->attribute["rid"];
		uint32_t time  = erit->attribute["time"];

		LOG(INFO) << "rid=" << rid << ",content=" << content;
	}   

	google::ShutdownGoogleLogging();
	return 0;
}
