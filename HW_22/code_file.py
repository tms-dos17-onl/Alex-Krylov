import xmltodict
import json
import argparse
import yaml
parser = argparse.ArgumentParser(description=' ')
parser.add_argument('--in-format', type=str, help=' ')
parser.add_argument('--in-file', help=' ')
parser.add_argument('--out-format', help=' ')
n = parser.parse_args()

if n.in_format =='xml':
    with open(n.in_file,'r') as xml_file:
     xml_data=xml_file.read()
     data_dict = xmltodict.parse(xml_data)
     if n.out_format == 'json':
        json_string=json.dumps(data_dict,indent=4)
        print(json_string)
     elif n.out_format == 'yaml':
        yaml_data2 = yaml.dump(data_dict, default_flow_style=False)
        print(yaml_data2) 
     elif n.out_format == 'xml':
        print(xml_data) 
      
elif n.in_format=='json':
     with open(n.in_file,'r') as json_file:
        json_data=json_file.read()
        json_dict=json.loads(json_data)
        if n.out_format == 'xml':
           xml_dict = xmltodict.unparse(json_dict, pretty=True)
           print(xml_dict)
        elif n.out_format == 'yaml':
           yaml_data3 = yaml.dump(json_dict, default_flow_style=False)
           print(yaml_data3)
        elif n.out_format == 'json':
         print(json_data)   
            
elif n.in_format == 'yaml':
      with open(n.in_file,'r') as yaml_file:
         yaml_data=yaml_file.read()
         yaml_dict=yaml.load(yaml_data,Loader=yaml.FullLoader)
         if n.out_format == 'xml':
             xml_dict1 = xmltodict.unparse(yaml_dict, pretty=True)
             print(xml_dict1)
         elif n.out_format == 'json':
          json_string1=json.dumps(yaml_dict,indent=4,default=str)
          print(json_string1)            
         elif n.out_format == 'yaml':
          print(yaml_data) 
