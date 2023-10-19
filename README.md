<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.9 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.47 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aws_eks"></a> [aws\_eks](#module\_aws\_eks) | terraform-aws-modules/eks/aws | n/a |
| <a name="module_key_pair"></a> [key\_pair](#module\_key\_pair) | terraform-aws-modules/key-pair/aws | ~> 2.0 |

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.aws_ebs_csi_driverrole](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.kms_key_for_encryption_on_ebs_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_iam_role_policy_attachment.aws_ebs_csi_driverrole_ebscsi_driver_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_eks_cluster_auth.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/eks_cluster_auth) | data source |
| [aws_iam_policy.ebscsi_driver_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy) | data source |
| [aws_kms_key.kms_ebs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_addition_sg_node"></a> [addition\_sg\_node](#input\_addition\_sg\_node) | The ID of the security group to associate with the worker nodes. | `string` | `""` | no |
| <a name="input_capacity_type"></a> [capacity\_type](#input\_capacity\_type) | The type of capacity to provision for the EBS volume. | `string` | n/a | yes |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | The Kubernetes version to use for the EKS cluster. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | The name of the environment (e.g. dev, prod). | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The EC2 instance type to use for the worker nodes. | `string` | n/a | yes |
| <a name="input_iops"></a> [iops](#input\_iops) | The number of IOPS to provision for the EBS volume. | `any` | n/a | yes |
| <a name="input_node_desired_size"></a> [node\_desired\_size](#input\_node\_desired\_size) | The desired number of worker nodes for the EKS cluster. | `any` | n/a | yes |
| <a name="input_node_max_size"></a> [node\_max\_size](#input\_node\_max\_size) | The maximum number of worker nodes for the EKS cluster. | `any` | n/a | yes |
| <a name="input_node_min_size"></a> [node\_min\_size](#input\_node\_min\_size) | The minimum number of worker nodes for the EKS cluster. | `any` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | A prefix to use for naming resources in the environment. | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | The name of the project this infrastructure is being created for. | `string` | n/a | yes |
| <a name="input_region_code"></a> [region\_code](#input\_region\_code) | The AWS region code where the infrastructure will be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to apply to the resources created. | `any` | n/a | yes |
| <a name="input_throughput"></a> [throughput](#input\_throughput) | The throughput to provision for the EBS volume. | `any` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The size of the EBS volume to attach to each worker node. | `any` | n/a | yes |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | The type of EBS volume to attach to each worker node. | `string` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | The VPC ID or VPC configuration for the EKS cluster. | `any` | n/a | yes |
| <a name="input_whitelist_ips"></a> [whitelist\_ips](#input\_whitelist\_ips) | n/a | `list(string)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_eks_cluster_auth_token"></a> [aws\_eks\_cluster\_auth\_token](#output\_aws\_eks\_cluster\_auth\_token) | n/a |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The unique identifier of the AWS EKS cluster. |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | The name of the AWS EKS cluster. |
| <a name="output_cluster_tls_certificate_sha1_fingerprint"></a> [cluster\_tls\_certificate\_sha1\_fingerprint](#output\_cluster\_tls\_certificate\_sha1\_fingerprint) | n/a |
| <a name="output_eks_cluster_certificate_authority_data"></a> [eks\_cluster\_certificate\_authority\_data](#output\_eks\_cluster\_certificate\_authority\_data) | The base64-encoded certificate data required to communicate securely with the Kubernetes API server of the AWS EKS cluster. |
| <a name="output_eks_cluster_endpoint"></a> [eks\_cluster\_endpoint](#output\_eks\_cluster\_endpoint) | The endpoint URL for the Kubernetes API server of the AWS EKS cluster. |
| <a name="output_eks_managed_node_groups_autoscaling_group_names"></a> [eks\_managed\_node\_groups\_autoscaling\_group\_names](#output\_eks\_managed\_node\_groups\_autoscaling\_group\_names) | The names of the Auto Scaling groups associated with the managed node groups in the AWS EKS cluster. |
| <a name="output_eks_oidc_provider_arn"></a> [eks\_oidc\_provider\_arn](#output\_eks\_oidc\_provider\_arn) | n/a |
<!-- END_TF_DOCS -->
# terraform-aws-eks [![Latest Release](https://img.shields.io/github/v/release/ptnglobalcorp/terraform-aws-eks.svg)](https://github.com/ptnglobalcorp/terraform-aws-eks/releases/latest)
㰊ⴡ‭䕂䥇彎䙔䑟䍏⁓ⴭਾ⌣删煥極敲敭瑮ੳ簊丠浡⁥⁼敖獲潩⁮੼⵼ⴭⴭ簭ⴭⴭⴭⴭ簭簊㰠⁡慮敭∽敲畱物浥湥彴整牲晡牯≭㰾愯‾瑛牥慲潦浲⡝爣煥極敲敭瑮彜整牲晡牯⥭簠㸠‽⸱‰੼⁼愼渠浡㵥爢煥極敲敭瑮慟獷㸢⼼㹡嬠睡嵳⌨敲畱物浥湥屴慟獷⁼㴾㐠㐮‷੼⁼愼渠浡㵥爢煥極敲敭瑮歟扵牥敮整≳㰾愯‾歛扵牥敮整嵳⌨敲畱物浥湥屴歟扵牥敮整⥳簠㸠‽⸲〱簠簊㰠⁡慮敭∽敲畱物浥湥彴楴敭㸢⼼㹡嬠楴敭⡝爣煥極敲敭瑮彜楴敭⁼㴾〠㤮簠簊㰠⁡慮敭∽敲畱物浥湥彴汴≳㰾愯‾瑛獬⡝爣煥極敲敭瑮彜汴⥳簠㸠‽⸳‰੼⌊‣牐癯摩牥ੳ簊丠浡⁥⁼敖獲潩⁮੼⵼ⴭⴭ簭ⴭⴭⴭⴭ簭簊㰠⁡慮敭∽牰癯摩牥慟獷㸢⼼㹡嬠睡嵳⌨牰癯摩牥彜睡⥳簠㸠‽⸴㜴簠ਊ⌣䴠摯汵獥ਊ⁼慎敭簠匠畯捲⁥⁼敖獲潩⁮੼⵼ⴭⴭ簭ⴭⴭⴭⴭ⵼ⴭⴭⴭⴭ੼⁼愼渠浡㵥洢摯汵彥睡彳步≳㰾愯‾慛獷彜步嵳⌨潭畤敬彜睡屳敟獫⁼整牲晡牯⵭睡⵳潭畤敬⽳步⽳睡⁳⁼⽮⁡੼⁼愼渠浡㵥洢摯汵彥敫役慰物㸢⼼㹡嬠敫屹灟楡嵲⌨潭畤敬彜敫屹灟楡⥲簠琠牥慲潦浲愭獷洭摯汵獥欯祥瀭楡⽲睡⁳⁼㹾㈠〮簠ਊ⌣删獥畯捲獥ਊ⁼慎敭簠吠灹⁥੼⵼ⴭⴭ簭ⴭⴭⴭ੼⁼慛獷楟浡牟汯⹥睡彳扥彳獣彩牤癩牥潲敬⡝瑨灴㩳⼯敲楧瑳祲琮牥慲潦浲椮⽯牰癯摩牥⽳慨桳捩牯⽰睡⽳慬整瑳搯捯⽳敲潳牵散⽳慩彭潲敬⁼敲潳牵散簠簊嬠睡彳慩彭潲敬灟汯捩⹹浫彳敫役潦彲湥牣灹楴湯潟彮扥彳潰楬祣⡝瑨灴㩳⼯敲楧瑳祲琮牥慲潦浲椮⽯牰癯摩牥⽳慨桳捩牯⽰睡⽳慬整瑳搯捯⽳敲潳牵散⽳慩彭潲敬灟汯捩⥹簠爠獥畯捲⁥੼⁼慛獷楟浡牟汯彥潰楬祣慟瑴捡浨湥⹴睡彳扥彳獣彩牤癩牥潲敬敟獢獣彩牤癩牥灟汯捩嵹栨瑴獰⼺爯来獩牴⹹整牲晡牯⹭潩瀯潲楶敤獲栯獡楨潣灲愯獷氯瑡獥⽴潤獣爯獥畯捲獥椯浡牟汯彥潰楬祣慟瑴捡浨湥⥴簠爠獥畯捲⁥੼⁼慛獷敟獫损畬瑳牥慟瑵⹨敤慦汵嵴栨瑴獰⼺爯来獩牴⹹整牲晡牯⹭潩瀯潲楶敤獲栯獡楨潣灲愯獷氯瑡獥⽴潤獣搯瑡ⵡ潳牵散⽳步彳汣獵整彲畡桴⁼慤慴猠畯捲⁥੼⁼慛獷楟浡灟汯捩⹹扥捳楳摟楲敶彲潰楬祣⡝瑨灴㩳⼯敲楧瑳祲琮牥慲潦浲椮⽯牰癯摩牥⽳慨桳捩牯⽰睡⽳慬整瑳搯捯⽳慤慴猭畯捲獥椯浡灟汯捩⥹簠搠瑡⁡潳牵散簠簊嬠睡彳浫彳敫⹹浫彳扥嵳栨瑴獰⼺爯来獩牴⹹整牲晡牯⹭潩瀯潲楶敤獲栯獡楨潣灲愯獷氯瑡獥⽴潤獣搯瑡ⵡ潳牵散⽳浫彳敫⥹簠搠瑡⁡潳牵散簠ਊ⌣䤠灮瑵ੳ簊丠浡⁥⁼敄捳楲瑰潩⁮⁼祔数簠䐠晥畡瑬簠删煥極敲⁤੼⵼ⴭⴭ簭ⴭⴭⴭⴭⴭⴭ簭ⴭⴭⴭ⵼ⴭⴭⴭⴭ㩼ⴭⴭⴭⴭ簺簊㰠⁡慮敭∽湩異彴摡楤楴湯獟彧潮敤㸢⼼㹡嬠摡楤楴湯彜杳彜潮敤⡝椣灮瑵彜摡楤楴湯彜杳彜潮敤⁼桔⁥䑉漠⁦桴⁥敳畣楲祴朠潲灵琠⁯獡潳楣瑡⁥楷桴琠敨眠牯敫⁲潮敤⹳簠怠瑳楲杮⁠⁼≠怢簠渠⁯੼⁼愼渠浡㵥椢灮瑵损灡捡瑩役祴数㸢⼼㹡嬠慣慰楣祴彜祴数⡝椣灮瑵彜慣慰楣祴彜祴数⁼桔⁥祴数漠⁦慣慰楣祴琠⁯牰癯獩潩⁮潦⁲桴⁥䉅⁓潶畬敭‮⁼獠牴湩恧簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴汣獵整彲敶獲潩≮㰾愯‾捛畬瑳牥彜敶獲潩嵮⌨湩異屴损畬瑳牥彜敶獲潩⥮簠吠敨䬠扵牥敮整⁳敶獲潩⁮潴甠敳映牯琠敨䔠卋挠畬瑳牥‮⁼獠牴湩恧簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴湥楶潲浮湥≴㰾愯‾敛癮物湯敭瑮⡝椣灮瑵彜湥楶潲浮湥⥴簠吠敨渠浡⁥景琠敨攠癮物湯敭瑮⠠⹥⹧搠癥‬牰摯⸩簠怠瑳楲杮⁠⁼⽮⁡⁼敹⁳੼⁼愼渠浡㵥椢灮瑵楟獮慴据彥祴数㸢⼼㹡嬠湩瑳湡散彜祴数⡝椣灮瑵彜湩瑳湡散彜祴数⁼桔⁥䍅′湩瑳湡散琠灹⁥潴甠敳映牯琠敨眠牯敫⁲潮敤⹳簠怠瑳楲杮⁠⁼⽮⁡⁼敹⁳੼⁼愼渠浡㵥椢灮瑵楟灯≳㰾愯‾楛灯嵳⌨湩異屴楟灯⥳簠吠敨渠浵敢⁲景䤠偏⁓潴瀠潲楶楳湯映牯琠敨䔠卂瘠汯浵⹥簠怠湡恹簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴潮敤摟獥物摥獟穩≥㰾愯‾湛摯履摟獥物摥彜楳敺⡝椣灮瑵彜潮敤彜敤楳敲層獟穩⥥簠吠敨搠獥物摥渠浵敢⁲景眠牯敫⁲潮敤⁳潦⁲桴⁥䭅⁓汣獵整⹲簠怠湡恹簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴潮敤浟硡獟穩≥㰾愯‾湛摯履浟硡彜楳敺⡝椣灮瑵彜潮敤彜慭屸獟穩⥥簠吠敨洠硡浩浵渠浵敢⁲景眠牯敫⁲潮敤⁳潦⁲桴⁥䭅⁓汣獵整⹲簠怠湡恹簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴潮敤浟湩獟穩≥㰾愯‾湛摯履浟湩彜楳敺⡝椣灮瑵彜潮敤彜業屮獟穩⥥簠吠敨洠湩浩浵渠浵敢⁲景眠牯敫⁲潮敤⁳潦⁲桴⁥䭅⁓汣獵整⹲簠怠湡恹簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴牰晥硩㸢⼼㹡嬠牰晥硩⡝椣灮瑵彜牰晥硩⁼⁁牰晥硩琠⁯獵⁥潦⁲慮業杮爠獥畯捲獥椠⁮桴⁥湥楶潲浮湥⹴簠怠瑳楲杮⁠⁼⽮⁡⁼敹⁳੼⁼愼渠浡㵥椢灮瑵灟潲敪瑣㸢⼼㹡嬠牰橯捥嵴⌨湩異屴灟潲敪瑣⁼桔⁥慮敭漠⁦桴⁥牰橯捥⁴桴獩椠普慲瑳畲瑣牵⁥獩戠楥杮挠敲瑡摥映牯‮⁼獠牴湩恧簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴敲楧湯损摯≥㰾愯‾牛来潩屮损摯嵥⌨湩異屴牟来潩屮损摯⥥簠吠敨䄠南爠来潩⁮潣敤眠敨敲琠敨椠普慲瑳畲瑣牵⁥楷汬戠⁥牣慥整⹤簠怠瑳楲杮⁠⁼⽮⁡⁼敹⁳੼⁼愼渠浡㵥椢灮瑵瑟条≳㰾愯‾瑛条嵳⌨湩異屴瑟条⥳簠䄠洠灡漠⁦慴獧琠⁯灡汰⁹潴琠敨爠獥畯捲獥挠敲瑡摥‮⁼慠祮⁠⁼⽮⁡⁼敹⁳੼⁼愼渠浡㵥椢灮瑵瑟牨畯桧異≴㰾愯‾瑛牨畯桧異嵴⌨湩異屴瑟牨畯桧異⥴簠吠敨琠牨畯桧異⁴潴瀠潲楶楳湯映牯琠敨䔠卂瘠汯浵⹥簠怠湡恹簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴潶畬敭獟穩≥㰾愯‾癛汯浵履獟穩嵥⌨湩異屴癟汯浵履獟穩⥥簠吠敨猠穩⁥景琠敨䔠卂瘠汯浵⁥潴愠瑴捡⁨潴攠捡⁨潷歲牥渠摯⹥簠怠湡恹簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴潶畬敭瑟灹≥㰾愯‾癛汯浵履瑟灹嵥⌨湩異屴癟汯浵履瑟灹⥥簠吠敨琠灹⁥景䔠卂瘠汯浵⁥潴愠瑴捡⁨潴攠捡⁨潷歲牥渠摯⹥簠怠瑳楲杮⁠⁼⽮⁡⁼敹⁳੼⁼愼渠浡㵥椢灮瑵癟捰㸢⼼㹡嬠灶嵣⌨湩異屴癟捰⁼桔⁥偖⁃䑉漠⁲偖⁃潣普杩牵瑡潩⁮潦⁲桴⁥䭅⁓汣獵整⹲簠怠湡恹簠渠愯簠礠獥簠簊㰠⁡慮敭∽湩異彴桷瑩汥獩彴灩≳㰾愯‾睛楨整楬瑳彜灩嵳⌨湩異屴睟楨整楬瑳彜灩⥳簠渠愯簠怠楬瑳猨牴湩⥧⁠⁼瀼敲嬾戼㹲†〢〮〮〮〯㰢牢崾⼼牰㹥簠渠⁯੼⌊‣畏灴瑵ੳ簊丠浡⁥⁼敄捳楲瑰潩⁮੼⵼ⴭⴭ簭ⴭⴭⴭⴭⴭⴭ簭簊㰠⁡慮敭∽畯灴瑵慟獷敟獫损畬瑳牥慟瑵彨潴敫≮㰾愯‾慛獷彜步屳损畬瑳牥彜畡桴彜潴敫嵮⌨畯灴瑵彜睡屳敟獫彜汣獵整屲慟瑵屨瑟歯湥⁼⽮⁡੼⁼愼渠浡㵥漢瑵異彴汣獵整彲摩㸢⼼㹡嬠汣獵整屲楟嵤⌨畯灴瑵彜汣獵整屲楟⥤簠吠敨甠楮畱⁥摩湥楴楦牥漠⁦桴⁥坁⁓䭅⁓汣獵整⹲簠簊㰠⁡慮敭∽畯灴瑵损畬瑳牥湟浡≥㰾愯‾捛畬瑳牥彜慮敭⡝漣瑵異屴损畬瑳牥彜慮敭⁼桔⁥慮敭漠⁦桴⁥坁⁓䭅⁓汣獵整⹲簠簊㰠⁡慮敭∽畯灴瑵损畬瑳牥瑟獬损牥楴楦慣整獟慨弱楦杮牥牰湩≴㰾愯‾捛畬瑳牥彜汴屳损牥楴楦慣整彜桳ㅡ彜楦杮牥牰湩嵴⌨畯灴瑵彜汣獵整屲瑟獬彜散瑲晩捩瑡履獟慨就晟湩敧灲楲瑮⁼⽮⁡੼⁼愼渠浡㵥漢瑵異彴步彳汣獵整彲散瑲晩捩瑡彥畡桴牯瑩役慤慴㸢⼼㹡嬠步屳损畬瑳牥彜散瑲晩捩瑡履慟瑵潨楲祴彜慤慴⡝漣瑵異屴敟獫彜汣獵整屲损牥楴楦慣整彜畡桴牯瑩屹摟瑡⥡簠吠敨戠獡㙥ⴴ湥潣敤⁤散瑲晩捩瑡⁥慤慴爠煥極敲⁤潴挠浯畭楮慣整猠捥牵汥⁹楷桴琠敨䬠扵牥敮整⁳偁⁉敳癲牥漠⁦桴⁥坁⁓䭅⁓汣獵整⹲簠簊㰠⁡慮敭∽畯灴瑵敟獫损畬瑳牥敟摮潰湩≴㰾愯‾敛獫彜汣獵整屲敟摮潰湩嵴⌨畯灴瑵彜步屳损畬瑳牥彜湥灤楯瑮⁼桔⁥湥灤楯瑮唠䱒映牯琠敨䬠扵牥敮整⁳偁⁉敳癲牥漠⁦桴⁥坁⁓䭅⁓汣獵整⹲簠簊㰠⁡慮敭∽畯灴瑵敟獫浟湡条摥湟摯彥牧畯獰慟瑵獯慣楬杮束潲灵湟浡獥㸢⼼㹡嬠步屳浟湡条摥彜潮敤彜牧畯獰彜畡潴捳污湩屧束潲灵彜慮敭嵳⌨畯灴瑵彜步屳浟湡条摥彜潮敤彜牧畯獰彜畡潴捳污湩屧束潲灵彜慮敭⥳簠吠敨渠浡獥漠⁦桴⁥畁潴匠慣楬杮朠潲灵⁳獡潳楣瑡摥眠瑩⁨桴⁥慭慮敧⁤潮敤朠潲灵⁳湩琠敨䄠南䔠卋挠畬瑳牥‮੼⁼愼渠浡㵥漢瑵異彴步彳楯捤灟潲楶敤彲牡≮㰾愯‾敛獫彜楯捤彜牰癯摩牥彜牡嵮⌨畯灴瑵彜步屳潟摩屣灟潲楶敤屲慟湲⁼⽮⁡੼ℼⴭ䔠䑎呟彆佄千ⴠ㸭