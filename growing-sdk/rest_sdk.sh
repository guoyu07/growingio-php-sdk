#!/bin/bash
    
curl -X POST 'https://api.growingio.com/custom/0a1b4118dd954ec3bcc69da5138bdb96/events' \
        -H 'Content-Type:application/json' \
        -H 'X-Client-Id:7f8it37dxdt91x4n5cvuvccc1cgaqe22' \
        -d '{
              "tm":1479273327760,
              "t":"cstm",
              "n": "create_chart",
            "e": {
                     "account_id": "0a1b4118dd954ec3bcc69da5138bdb96",
                     "chart_dimension_count": 12,
                     "chart_id": 9999,
                     "chart_metric_count":1,
                     "chart_name":"curl 打点测试",
                     "chart_type":"line"
                  
            }

        }' 

