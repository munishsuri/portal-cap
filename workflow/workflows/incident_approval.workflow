{
	"contents": {
		"2bbf8fdc-c5df-413e-9c98-c7ec0167a928": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "incident_approval",
			"subject": "Incident ${context.title}",
			"name": "incident_approval",
			"documentation": "",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"95395416-6856-4862-84cd-3e1eacf4fd82": {
					"name": "UserTask1"
				},
				"e76f5952-f6f4-47f5-bc83-0d27d8832561": {
					"name": "ExclusiveGateway1"
				},
				"820a32d4-c2b7-4d75-bdac-8302d1079b74": {
					"name": "ServiceTask1"
				},
				"18af0f30-e984-4031-aaaf-cd1521a6d283": {
					"name": "ScriptTask1"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"e7f7d7db-5979-439b-9be0-11978953f4f1": {
					"name": "SequenceFlow2"
				},
				"59eead45-12c6-4639-8982-502755840a5e": {
					"name": "SequenceFlow3"
				},
				"2004df1f-79c3-44fa-805d-f368e55bdcd7": {
					"name": "SequenceFlow4"
				},
				"983d68ca-4268-4b5c-b30c-42b9b74d7a2c": {
					"name": "SequenceFlow5"
				},
				"32c899b5-e2c6-44f5-bf48-5594335ba582": {
					"name": "SequenceFlow6"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"95395416-6856-4862-84cd-3e1eacf4fd82": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "${context.description}",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${context.users}",
			"formReference": "/forms/incident_approval/approvalForm.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approvalform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "UserTask1"
		},
		"e76f5952-f6f4-47f5-bc83-0d27d8832561": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "ExclusiveGateway1",
			"default": "2004df1f-79c3-44fa-805d-f368e55bdcd7"
		},
		"820a32d4-c2b7-4d75-bdac-8302d1079b74": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "testService",
			"path": "/Incidents/${context.ID}",
			"httpMethod": "PATCH",
			"requestVariable": "${context.request}",
			"responseVariable": "${context.resp_service}",
			"id": "servicetask1",
			"name": "ServiceTask1"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "95395416-6856-4862-84cd-3e1eacf4fd82"
		},
		"e7f7d7db-5979-439b-9be0-11978953f4f1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "95395416-6856-4862-84cd-3e1eacf4fd82",
			"targetRef": "e76f5952-f6f4-47f5-bc83-0d27d8832561"
		},
		"59eead45-12c6-4639-8982-502755840a5e": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision ==\"accepta\"}",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "e76f5952-f6f4-47f5-bc83-0d27d8832561",
			"targetRef": "18af0f30-e984-4031-aaaf-cd1521a6d283"
		},
		"2004df1f-79c3-44fa-805d-f368e55bdcd7": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "e76f5952-f6f4-47f5-bc83-0d27d8832561",
			"targetRef": "95395416-6856-4862-84cd-3e1eacf4fd82"
		},
		"983d68ca-4268-4b5c-b30c-42b9b74d7a2c": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "820a32d4-c2b7-4d75-bdac-8302d1079b74",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"2216d146-6f5b-40e9-8f48-64acfa5d1315": {},
				"031e0c11-626e-42a7-b255-a7a2aba1407c": {},
				"3939ece7-9778-42a1-88cb-c196e8cd1b65": {},
				"99bc3066-6949-429c-8677-b1f83460e240": {},
				"8146908a-a375-480f-9594-ac5ef4fde790": {},
				"3f26180c-b47f-4192-88ad-1cfb524e0d5a": {},
				"a0e92a32-e0a5-4d9a-8099-a5555dfcc706": {},
				"70f4c27b-2504-4324-98ec-039e89c51752": {},
				"5fb7e37d-a978-4285-a820-0f43a8c72474": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 100,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 545,
			"y": 199,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,117 220,117",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "2216d146-6f5b-40e9-8f48-64acfa5d1315",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"2216d146-6f5b-40e9-8f48-64acfa5d1315": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 170,
			"y": 88,
			"width": 100,
			"height": 60,
			"object": "95395416-6856-4862-84cd-3e1eacf4fd82"
		},
		"031e0c11-626e-42a7-b255-a7a2aba1407c": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "220,119.5 337,119.5",
			"sourceSymbol": "2216d146-6f5b-40e9-8f48-64acfa5d1315",
			"targetSymbol": "3939ece7-9778-42a1-88cb-c196e8cd1b65",
			"object": "e7f7d7db-5979-439b-9be0-11978953f4f1"
		},
		"3939ece7-9778-42a1-88cb-c196e8cd1b65": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 316,
			"y": 100,
			"object": "e76f5952-f6f4-47f5-bc83-0d27d8832561"
		},
		"99bc3066-6949-429c-8677-b1f83460e240": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "337,121 425,121",
			"sourceSymbol": "3939ece7-9778-42a1-88cb-c196e8cd1b65",
			"targetSymbol": "70f4c27b-2504-4324-98ec-039e89c51752",
			"object": "59eead45-12c6-4639-8982-502755840a5e"
		},
		"8146908a-a375-480f-9594-ac5ef4fde790": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "337,121 337,263 293,263 293,136 205,136",
			"sourceSymbol": "3939ece7-9778-42a1-88cb-c196e8cd1b65",
			"targetSymbol": "2216d146-6f5b-40e9-8f48-64acfa5d1315",
			"object": "2004df1f-79c3-44fa-805d-f368e55bdcd7"
		},
		"3f26180c-b47f-4192-88ad-1cfb524e0d5a": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 513,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "820a32d4-c2b7-4d75-bdac-8302d1079b74"
		},
		"a0e92a32-e0a5-4d9a-8099-a5555dfcc706": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "562.75,121 562.75,216.5",
			"sourceSymbol": "3f26180c-b47f-4192-88ad-1cfb524e0d5a",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "983d68ca-4268-4b5c-b30c-42b9b74d7a2c"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 6,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 1,
			"scripttask": 1,
			"exclusivegateway": 1
		},
		"18af0f30-e984-4031-aaaf-cd1521a6d283": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/incident_approval/setStatus.js",
			"id": "scripttask1",
			"name": "ScriptTask1"
		},
		"70f4c27b-2504-4324-98ec-039e89c51752": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 375,
			"y": 91,
			"width": 100,
			"height": 60,
			"object": "18af0f30-e984-4031-aaaf-cd1521a6d283"
		},
		"32c899b5-e2c6-44f5-bf48-5594335ba582": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "18af0f30-e984-4031-aaaf-cd1521a6d283",
			"targetRef": "820a32d4-c2b7-4d75-bdac-8302d1079b74"
		},
		"5fb7e37d-a978-4285-a820-0f43a8c72474": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "425,121 563,121",
			"sourceSymbol": "70f4c27b-2504-4324-98ec-039e89c51752",
			"targetSymbol": "3f26180c-b47f-4192-88ad-1cfb524e0d5a",
			"object": "32c899b5-e2c6-44f5-bf48-5594335ba582"
		}
	}
}