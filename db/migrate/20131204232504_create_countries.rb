class CreateCountries < ActiveRecord::Migration
  def change


    create_table :countries do |t|
      t.column :name, :string, :size => 100 
      t.column :iso2, :string, :size => 2
      t.column :iso3, :string, :size => 3
      t.column :numcode, :integer

      t.timestamps
    end

    Country.create(:name => 'Afghanistan', :iso3 => 'AFG', :iso2 => 'AF', :numcode => 4)
    Country.create(:name => 'Aland Islands', :iso3 => 'ALA', :iso2 => 'AX', :numcode => 248)
    Country.create(:name => 'Albania', :iso3 => 'ALB', :iso2 => 'AL', :numcode => 8)
    Country.create(:name => 'Algeria', :iso3 => 'DZA', :iso2 => 'DZ', :numcode => 12)
    Country.create(:name => 'American Samoa', :iso3 => 'ASM', :iso2 => 'AS', :numcode => 16)
    Country.create(:name => 'Andorra', :iso3 => 'AND', :iso2 => 'AD', :numcode => 20)
    Country.create(:name => 'Angola', :iso3 => 'AGO', :iso2 => 'AO', :numcode => 24)
    Country.create(:name => 'Anguilla', :iso3 => 'AIA', :iso2 => 'AI', :numcode => 660)
    Country.create(:name => 'Antarctica', :iso3 => 'ATA', :iso2 => 'AQ', :numcode => 10)
    Country.create(:name => 'Antigua and Barbuda', :iso3 => 'ATG', :iso2 => 'AG', :numcode => 28)
    Country.create(:name => 'Argentina', :iso3 => 'ARG', :iso2 => 'AR', :numcode => 32)
    Country.create(:name => 'Armenia', :iso3 => 'ARM', :iso2 => 'AM', :numcode => 51)
    Country.create(:name => 'Aruba', :iso3 => 'ABW', :iso2 => 'AW', :numcode => 533)
    Country.create(:name => 'Australia', :iso3 => 'AUS', :iso2 => 'AU', :numcode => 36)
    Country.create(:name => 'Austria', :iso3 => 'AUT', :iso2 => 'AT', :numcode => 40)
    Country.create(:name => 'Azerbaijan', :iso3 => 'AZE', :iso2 => 'AZ', :numcode => 31)
    Country.create(:name => 'Bahamas', :iso3 => 'BHS', :iso2 => 'BS', :numcode => 44)
    Country.create(:name => 'Bahrain', :iso3 => 'BHR', :iso2 => 'BH', :numcode => 48)
    Country.create(:name => 'Bangladesh', :iso3 => 'BGD', :iso2 => 'BD', :numcode => 50)
    Country.create(:name => 'Barbados', :iso3 => 'BRB', :iso2 => 'BB', :numcode => 52)
    Country.create(:name => 'Belarus', :iso3 => 'BLR', :iso2 => 'BY', :numcode => 112)
    Country.create(:name => 'Belgium', :iso3 => 'BEL', :iso2 => 'BE', :numcode => 56)
    Country.create(:name => 'Belize', :iso3 => 'BLZ', :iso2 => 'BZ', :numcode => 84)
    Country.create(:name => 'Benin', :iso3 => 'BEN', :iso2 => 'BJ', :numcode => 204)
    Country.create(:name => 'Bermuda', :iso3 => 'BMU', :iso2 => 'BM', :numcode => 60)
    Country.create(:name => 'Bhutan', :iso3 => 'BTN', :iso2 => 'BT', :numcode => 64)
    Country.create(:name => 'Bolivia', :iso3 => 'BOL', :iso2 => 'BO', :numcode => 68)
    Country.create(:name => 'Bosnia and Herzegovina', :iso3 => 'BIH', :iso2 => 'BA', :numcode => 70)
    Country.create(:name => 'Botswana', :iso3 => 'BWA', :iso2 => 'BW', :numcode => 72)
    Country.create(:name => 'Bouvet Island', :iso3 => 'BVT', :iso2 => 'BV', :numcode => 74)
    Country.create(:name => 'Brazil', :iso3 => 'BRA', :iso2 => 'BR', :numcode => 76)
    Country.create(:name => 'British Indian Ocean Territory', :iso3 => 'IOT', :iso2 => 'IO', :numcode => 86)
    Country.create(:name => 'Brunei Darussalam', :iso3 => 'BRN', :iso2 => 'BN', :numcode => 96)
    Country.create(:name => 'Bulgaria', :iso3 => 'BGR', :iso2 => 'BG', :numcode => 100)
    Country.create(:name => 'Burkina Faso', :iso3 => 'BFA', :iso2 => 'BF', :numcode => 854)
    Country.create(:name => 'Burundi', :iso3 => 'BDI', :iso2 => 'BI', :numcode => 108)
    Country.create(:name => 'Cambodia', :iso3 => 'KHM', :iso2 => 'KH', :numcode => 116)
    Country.create(:name => 'Cameroon', :iso3 => 'CMR', :iso2 => 'CM', :numcode => 120)
    Country.create(:name => 'Canada', :iso3 => 'CAN', :iso2 => 'CA', :numcode => 124)
    Country.create(:name => 'Cape Verde', :iso3 => 'CPV', :iso2 => 'CV', :numcode => 132)
    Country.create(:name => 'Cayman Islands', :iso3 => 'CYM', :iso2 => 'KY', :numcode => 136)
    Country.create(:name => 'Central African Republic', :iso3 => 'CAF', :iso2 => 'CF', :numcode => 140)
    Country.create(:name => 'Chad', :iso3 => 'TCD', :iso2 => 'TD', :numcode => 148)
    Country.create(:name => 'Chile', :iso3 => 'CHL', :iso2 => 'CL', :numcode => 152)
    Country.create(:name => 'China', :iso3 => 'CHN', :iso2 => 'CN', :numcode => 156)
    Country.create(:name => 'Christmas Island', :iso3 => 'CXR', :iso2 => 'CX', :numcode => 162)
    Country.create(:name => 'Cocos (Keeling) Islands', :iso3 => 'CCK', :iso2 => 'CC', :numcode => 166)
    Country.create(:name => 'Colombia', :iso3 => 'COL', :iso2 => 'CO', :numcode => 170)
    Country.create(:name => 'Comoros', :iso3 => 'COM', :iso2 => 'KM', :numcode => 174)
    Country.create(:name => 'Congo', :iso3 => 'COG', :iso2 => 'CG', :numcode => 178)
    Country.create(:name => 'Congo, the Democratic Republic of the', :iso3 => 'COD', :iso2 => 'CD', :numcode => 180)
    Country.create(:name => 'Cook Islands', :iso3 => 'COK', :iso2 => 'CK', :numcode => 184)
    Country.create(:name => 'Costa Rica', :iso3 => 'CRI', :iso2 => 'CR', :numcode => 188)
    Country.create(:name => 'Croatia', :iso3 => 'HRV', :iso2 => 'HR', :numcode => 191)
    Country.create(:name => 'Cuba', :iso3 => 'CUB', :iso2 => 'CU', :numcode => 192)
    Country.create(:name => 'Cyprus', :iso3 => 'CYP', :iso2 => 'CY', :numcode => 196)
    Country.create(:name => 'Czech Republic', :iso3 => 'CZE', :iso2 => 'CZ', :numcode => 203)
    Country.create(:name => 'Côte d\'Ivoire', :iso3 => 'CIV', :iso2 => 'CI', :numcode => 384)
    Country.create(:name => 'Denmark', :iso3 => 'DNK', :iso2 => 'DK', :numcode => 208)
    Country.create(:name => 'Djibouti', :iso3 => 'DJI', :iso2 => 'DJ', :numcode => 262)
    Country.create(:name => 'Dominica', :iso3 => 'DMA', :iso2 => 'DM', :numcode => 212)
    Country.create(:name => 'Dominican Republic', :iso3 => 'DOM', :iso2 => 'DO', :numcode => 214)
    Country.create(:name => 'Ecuador', :iso3 => 'ECU', :iso2 => 'EC', :numcode => 218)
    Country.create(:name => 'Egypt', :iso3 => 'EGY', :iso2 => 'EG', :numcode => 818)
    Country.create(:name => 'El Salvador', :iso3 => 'SLV', :iso2 => 'SV', :numcode => 222)
    Country.create(:name => 'Equatorial Guinea', :iso3 => 'GNQ', :iso2 => 'GQ', :numcode => 226)
    Country.create(:name => 'Eritrea', :iso3 => 'ERI', :iso2 => 'ER', :numcode => 232)
    Country.create(:name => 'Estonia', :iso3 => 'EST', :iso2 => 'EE', :numcode => 233)
    Country.create(:name => 'Ethiopia', :iso3 => 'ETH', :iso2 => 'ET', :numcode => 231)
    Country.create(:name => 'Falkland Islands (Malvinas)', :iso3 => 'FLK', :iso2 => 'FK', :numcode => 238)
    Country.create(:name => 'Faroe Islands', :iso3 => 'FRO', :iso2 => 'FO', :numcode => 234)
    Country.create(:name => 'Fiji', :iso3 => 'FJI', :iso2 => 'FJ', :numcode => 242)
    Country.create(:name => 'Finland', :iso3 => 'FIN', :iso2 => 'FI', :numcode => 246)
    Country.create(:name => 'France', :iso3 => 'FRA', :iso2 => 'FR', :numcode => 250)
    Country.create(:name => 'French Guiana', :iso3 => 'GUF', :iso2 => 'GF', :numcode => 254)
    Country.create(:name => 'French Polynesia', :iso3 => 'PYF', :iso2 => 'PF', :numcode => 258)
    Country.create(:name => 'French Southern Territories', :iso3 => 'ATF', :iso2 => 'TF', :numcode => 260)
    Country.create(:name => 'Gabon', :iso3 => 'GAB', :iso2 => 'GA', :numcode => 266)
    Country.create(:name => 'Gambia', :iso3 => 'GMB', :iso2 => 'GM', :numcode => 270)
    Country.create(:name => 'Georgia', :iso3 => 'GEO', :iso2 => 'GE', :numcode => 268)
    Country.create(:name => 'Germany', :iso3 => 'DEU', :iso2 => 'DE', :numcode => 276)
    Country.create(:name => 'Ghana', :iso3 => 'GHA', :iso2 => 'GH', :numcode => 288)
    Country.create(:name => 'Gibraltar', :iso3 => 'GIB', :iso2 => 'GI', :numcode => 292)
    Country.create(:name => 'Greece', :iso3 => 'GRC', :iso2 => 'GR', :numcode => 300)
    Country.create(:name => 'Greenland', :iso3 => 'GRL', :iso2 => 'GL', :numcode => 304)
    Country.create(:name => 'Grenada', :iso3 => 'GRD', :iso2 => 'GD', :numcode => 308)
    Country.create(:name => 'Guadeloupe', :iso3 => 'GLP', :iso2 => 'GP', :numcode => 312)
    Country.create(:name => 'Guam', :iso3 => 'GUM', :iso2 => 'GU', :numcode => 316)
    Country.create(:name => 'Guatemala', :iso3 => 'GTM', :iso2 => 'GT', :numcode => 320)
    Country.create(:name => 'Guernsey', :iso3 => 'GGY', :iso2 => 'GG', :numcode => 831)
    Country.create(:name => 'Guinea', :iso3 => 'GIN', :iso2 => 'GN', :numcode => 324)
    Country.create(:name => 'Guinea-Bissau', :iso3 => 'GNB', :iso2 => 'GW', :numcode => 624)
    Country.create(:name => 'Guyana', :iso3 => 'GUY', :iso2 => 'GY', :numcode => 328)
    Country.create(:name => 'Haiti', :iso3 => 'HTI', :iso2 => 'HT', :numcode => 332)
    Country.create(:name => 'Heard Island and McDonald Islands', :iso3 => 'HMD', :iso2 => 'HM', :numcode => 334)
    Country.create(:name => 'Holy See (Vatican City State)', :iso3 => 'VAT', :iso2 => 'VA', :numcode => 336)
    Country.create(:name => 'Honduras', :iso3 => 'HND', :iso2 => 'HN', :numcode => 340)
    Country.create(:name => 'Hong Kong', :iso3 => 'HKG', :iso2 => 'HK', :numcode => 344)
    Country.create(:name => 'Hungary', :iso3 => 'HUN', :iso2 => 'HU', :numcode => 348)
    Country.create(:name => 'Iceland', :iso3 => 'ISL', :iso2 => 'IS', :numcode => 352)
    Country.create(:name => 'India', :iso3 => 'IND', :iso2 => 'IN', :numcode => 356)
    Country.create(:name => 'Indonesia', :iso3 => 'IDN', :iso2 => 'ID', :numcode => 360)
    Country.create(:name => 'Iran, Islamic Republic of', :iso3 => 'IRN', :iso2 => 'IR', :numcode => 364)
    Country.create(:name => 'Iraq', :iso3 => 'IRQ', :iso2 => 'IQ', :numcode => 368)
    Country.create(:name => 'Ireland', :iso3 => 'IRL', :iso2 => 'IE', :numcode => 372)
    Country.create(:name => 'Isle of Man', :iso3 => 'IMN', :iso2 => 'IM', :numcode => 833)
    Country.create(:name => 'Israel', :iso3 => 'ISR', :iso2 => 'IL', :numcode => 376)
    Country.create(:name => 'Italy', :iso3 => 'ITA', :iso2 => 'IT', :numcode => 380)
    Country.create(:name => 'Jamaica', :iso3 => 'JAM', :iso2 => 'JM', :numcode => 388)
    Country.create(:name => 'Japan', :iso3 => 'JPN', :iso2 => 'JP', :numcode => 392)
    Country.create(:name => 'Jersey', :iso3 => 'JEY', :iso2 => 'JE', :numcode => 832)
    Country.create(:name => 'Jordan', :iso3 => 'JOR', :iso2 => 'JO', :numcode => 400)
    Country.create(:name => 'Kazakhstan', :iso3 => 'KAZ', :iso2 => 'KZ', :numcode => 398)
    Country.create(:name => 'Kenya', :iso3 => 'KEN', :iso2 => 'KE', :numcode => 404)
    Country.create(:name => 'Kiribati', :iso3 => 'KIR', :iso2 => 'KI', :numcode => 296)
    Country.create(:name => 'Korea, Democratic People\'s Republic of', :iso3 => 'PRK', :iso2 => 'KP', :numcode => 408)
    Country.create(:name => 'Korea, Republic of', :iso3 => 'KOR', :iso2 => 'KR', :numcode => 410)
    Country.create(:name => 'Kuwait', :iso3 => 'KWT', :iso2 => 'KW', :numcode => 414)
    Country.create(:name => 'Kyrgyzstan', :iso3 => 'KGZ', :iso2 => 'KG', :numcode => 417)
    Country.create(:name => 'Lao People\'s Democratic Republic', :iso3 => 'LAO', :iso2 => 'LA', :numcode => 418)
    Country.create(:name => 'Latvia', :iso3 => 'LVA', :iso2 => 'LV', :numcode => 428)
    Country.create(:name => 'Lebanon', :iso3 => 'LBN', :iso2 => 'LB', :numcode => 422)
    Country.create(:name => 'Lesotho', :iso3 => 'LSO', :iso2 => 'LS', :numcode => 426)
    Country.create(:name => 'Liberia', :iso3 => 'LBR', :iso2 => 'LR', :numcode => 430)
    Country.create(:name => 'Libyan Arab Jamahiriya', :iso3 => 'LBY', :iso2 => 'LY', :numcode => 434)
    Country.create(:name => 'Liechtenstein', :iso3 => 'LIE', :iso2 => 'LI', :numcode => 438)
    Country.create(:name => 'Lithuania', :iso3 => 'LTU', :iso2 => 'LT', :numcode => 440)
    Country.create(:name => 'Luxembourg', :iso3 => 'LUX', :iso2 => 'LU', :numcode => 442)
    Country.create(:name => 'Macao', :iso3 => 'MAC', :iso2 => 'MO', :numcode => 446)
    Country.create(:name => 'Macedonia, the former Yugoslav Republic of', :iso3 => 'MKD', :iso2 => 'MK', :numcode => 807)
    Country.create(:name => 'Madagascar', :iso3 => 'MDG', :iso2 => 'MG', :numcode => 450)
    Country.create(:name => 'Malawi', :iso3 => 'MWI', :iso2 => 'MW', :numcode => 454)
    Country.create(:name => 'Malaysia', :iso3 => 'MYS', :iso2 => 'MY', :numcode => 458)
    Country.create(:name => 'Maldives', :iso3 => 'MDV', :iso2 => 'MV', :numcode => 462)
    Country.create(:name => 'Mali', :iso3 => 'MLI', :iso2 => 'ML', :numcode => 466)
    Country.create(:name => 'Malta', :iso3 => 'MLT', :iso2 => 'MT', :numcode => 470)
    Country.create(:name => 'Marshall Islands', :iso3 => 'MHL', :iso2 => 'MH', :numcode => 584)
    Country.create(:name => 'Martinique', :iso3 => 'MTQ', :iso2 => 'MQ', :numcode => 474)
    Country.create(:name => 'Mauritania', :iso3 => 'MRT', :iso2 => 'MR', :numcode => 478)
    Country.create(:name => 'Mauritius', :iso3 => 'MUS', :iso2 => 'MU', :numcode => 480)
    Country.create(:name => 'Mayotte', :iso3 => 'MYT', :iso2 => 'YT', :numcode => 175)
    Country.create(:name => 'Mexico', :iso3 => 'MEX', :iso2 => 'MX', :numcode => 484)
    Country.create(:name => 'Micronesia, Federated States of', :iso3 => 'FSM', :iso2 => 'FM', :numcode => 583)
    Country.create(:name => 'Moldova, Republic of', :iso3 => 'MDA', :iso2 => 'MD', :numcode => 498)
    Country.create(:name => 'Monaco', :iso3 => 'MCO', :iso2 => 'MC', :numcode => 492)
    Country.create(:name => 'Mongolia', :iso3 => 'MNG', :iso2 => 'MN', :numcode => 496)
    Country.create(:name => 'Montenegro', :iso3 => 'MNE', :iso2 => 'ME', :numcode => 499)
    Country.create(:name => 'Montserrat', :iso3 => 'MSR', :iso2 => 'MS', :numcode => 500)
    Country.create(:name => 'Morocco', :iso3 => 'MAR', :iso2 => 'MA', :numcode => 504)
    Country.create(:name => 'Mozambique', :iso3 => 'MOZ', :iso2 => 'MZ', :numcode => 508)
    Country.create(:name => 'Myanmar', :iso3 => 'MMR', :iso2 => 'MM', :numcode => 104)
    Country.create(:name => 'Namibia', :iso3 => 'NAM', :iso2 => 'NA', :numcode => 516)
    Country.create(:name => 'Nauru', :iso3 => 'NRU', :iso2 => 'NR', :numcode => 520)
    Country.create(:name => 'Nepal', :iso3 => 'NPL', :iso2 => 'NP', :numcode => 524)
    Country.create(:name => 'Netherlands', :iso3 => 'NLD', :iso2 => 'NL', :numcode => 528)
    Country.create(:name => 'Netherlands Antilles', :iso3 => 'ANT', :iso2 => 'AN', :numcode => 530)
    Country.create(:name => 'New Caledonia', :iso3 => 'NCL', :iso2 => 'NC', :numcode => 540)
    Country.create(:name => 'New Zealand', :iso3 => 'NZL', :iso2 => 'NZ', :numcode => 554)
    Country.create(:name => 'Nicaragua', :iso3 => 'NIC', :iso2 => 'NI', :numcode => 558)
    Country.create(:name => 'Niger', :iso3 => 'NER', :iso2 => 'NE', :numcode => 562)
    Country.create(:name => 'Nigeria', :iso3 => 'NGA', :iso2 => 'NG', :numcode => 566)
    Country.create(:name => 'Niue', :iso3 => 'NIU', :iso2 => 'NU', :numcode => 570)
    Country.create(:name => 'Norfolk Island', :iso3 => 'NFK', :iso2 => 'NF', :numcode => 574)
    Country.create(:name => 'Northern Mariana Islands', :iso3 => 'MNP', :iso2 => 'MP', :numcode => 580)
    Country.create(:name => 'Norway', :iso3 => 'NOR', :iso2 => 'NO', :numcode => 578)
    Country.create(:name => 'Oman', :iso3 => 'OMN', :iso2 => 'OM', :numcode => 512)
    Country.create(:name => 'Pakistan', :iso3 => 'PAK', :iso2 => 'PK', :numcode => 586)
    Country.create(:name => 'Palau', :iso3 => 'PLW', :iso2 => 'PW', :numcode => 585)
    Country.create(:name => 'Palestinian Territory, Occupied', :iso3 => 'PSE', :iso2 => 'PS', :numcode => 275)
    Country.create(:name => 'Panama', :iso3 => 'PAN', :iso2 => 'PA', :numcode => 591)
    Country.create(:name => 'Papua New Guinea', :iso3 => 'PNG', :iso2 => 'PG', :numcode => 598)
    Country.create(:name => 'Paraguay', :iso3 => 'PRY', :iso2 => 'PY', :numcode => 600)
    Country.create(:name => 'Peru', :iso3 => 'PER', :iso2 => 'PE', :numcode => 604)
    Country.create(:name => 'Philippines', :iso3 => 'PHL', :iso2 => 'PH', :numcode => 608)
    Country.create(:name => 'Pitcairn', :iso3 => 'PCN', :iso2 => 'PN', :numcode => 612)
    Country.create(:name => 'Poland', :iso3 => 'POL', :iso2 => 'PL', :numcode => 616)
    Country.create(:name => 'Portugal', :iso3 => 'PRT', :iso2 => 'PT', :numcode => 620)
    Country.create(:name => 'Puerto Rico', :iso3 => 'PRI', :iso2 => 'PR', :numcode => 630)
    Country.create(:name => 'Qatar', :iso3 => 'QAT', :iso2 => 'QA', :numcode => 634)
    Country.create(:name => 'Romania', :iso3 => 'ROU', :iso2 => 'RO', :numcode => 642)
    Country.create(:name => 'Russian Federation', :iso3 => 'RUS', :iso2 => 'RU', :numcode => 643)
    Country.create(:name => 'Rwanda', :iso3 => 'RWA', :iso2 => 'RW', :numcode => 646)
    Country.create(:name => 'Réunion', :iso3 => 'REU', :iso2 => 'RE', :numcode => 638)
    Country.create(:name => 'Saint Barthélemy', :iso3 => 'BLM', :iso2 => 'BL', :numcode => 652)
    Country.create(:name => 'Saint Helena', :iso3 => 'SHN', :iso2 => 'SH', :numcode => 654)
    Country.create(:name => 'Saint Kitts and Nevis', :iso3 => 'KNA', :iso2 => 'KN', :numcode => 659)
    Country.create(:name => 'Saint Lucia', :iso3 => 'LCA', :iso2 => 'LC', :numcode => 662)
    Country.create(:name => 'Saint Martin (French part)', :iso3 => 'MAF', :iso2 => 'MF', :numcode => 663)
    Country.create(:name => 'Saint Pierre and Miquelon', :iso3 => 'SPM', :iso2 => 'PM', :numcode => 666)
    Country.create(:name => 'Saint Vincent and the Grenadines', :iso3 => 'VCT', :iso2 => 'VC', :numcode => 670)
    Country.create(:name => 'Samoa', :iso3 => 'WSM', :iso2 => 'WS', :numcode => 882)
    Country.create(:name => 'San Marino', :iso3 => 'SMR', :iso2 => 'SM', :numcode => 674)
    Country.create(:name => 'Sao Tome and Principe', :iso3 => 'STP', :iso2 => 'ST', :numcode => 678)
    Country.create(:name => 'Saudi Arabia', :iso3 => 'SAU', :iso2 => 'SA', :numcode => 682)
    Country.create(:name => 'Senegal', :iso3 => 'SEN', :iso2 => 'SN', :numcode => 686)
    Country.create(:name => 'Serbia', :iso3 => 'SRB', :iso2 => 'RS', :numcode => 688)
    Country.create(:name => 'Seychelles', :iso3 => 'SYC', :iso2 => 'SC', :numcode => 690)
    Country.create(:name => 'Sierra Leone', :iso3 => 'SLE', :iso2 => 'SL', :numcode => 694)
    Country.create(:name => 'Singapore', :iso3 => 'SGP', :iso2 => 'SG', :numcode => 702)
    Country.create(:name => 'Slovakia', :iso3 => 'SVK', :iso2 => 'SK', :numcode => 703)
    Country.create(:name => 'Slovenia', :iso3 => 'SVN', :iso2 => 'SI', :numcode => 705)
    Country.create(:name => 'Solomon Islands', :iso3 => 'SLB', :iso2 => 'SB', :numcode => 90)
    Country.create(:name => 'Somalia', :iso3 => 'SOM', :iso2 => 'SO', :numcode => 706)
    Country.create(:name => 'South Africa', :iso3 => 'ZAF', :iso2 => 'ZA', :numcode => 710)
    Country.create(:name => 'South Georgia and the South Sandwich Islands', :iso3 => 'SGS', :iso2 => 'GS', :numcode => 239)
    Country.create(:name => 'Spain', :iso3 => 'ESP', :iso2 => 'ES', :numcode => 724)
    Country.create(:name => 'Sri Lanka', :iso3 => 'LKA', :iso2 => 'LK', :numcode => 144)
    Country.create(:name => 'Sudan', :iso3 => 'SDN', :iso2 => 'SD', :numcode => 736)
    Country.create(:name => 'Suriname', :iso3 => 'SUR', :iso2 => 'SR', :numcode => 740)
    Country.create(:name => 'Svalbard and Jan Mayen', :iso3 => 'SJM', :iso2 => 'SJ', :numcode => 744)
    Country.create(:name => 'Swaziland', :iso3 => 'SWZ', :iso2 => 'SZ', :numcode => 748)
    Country.create(:name => 'Sweden', :iso3 => 'SWE', :iso2 => 'SE', :numcode => 752)
    Country.create(:name => 'Switzerland', :iso3 => 'CHE', :iso2 => 'CH', :numcode => 756)
    Country.create(:name => 'Syrian Arab Republic', :iso3 => 'SYR', :iso2 => 'SY', :numcode => 760)
    Country.create(:name => 'Taiwan, Province of China', :iso3 => 'TWN', :iso2 => 'TW', :numcode => 158)
    Country.create(:name => 'Tajikistan', :iso3 => 'TJK', :iso2 => 'TJ', :numcode => 762)
    Country.create(:name => 'Tanzania, United Republic of', :iso3 => 'TZA', :iso2 => 'TZ', :numcode => 834)
    Country.create(:name => 'Thailand', :iso3 => 'THA', :iso2 => 'TH', :numcode => 764)
    Country.create(:name => 'Timor-Leste', :iso3 => 'TLS', :iso2 => 'TL', :numcode => 626)
    Country.create(:name => 'Togo', :iso3 => 'TGO', :iso2 => 'TG', :numcode => 768)
    Country.create(:name => 'Tokelau', :iso3 => 'TKL', :iso2 => 'TK', :numcode => 772)
    Country.create(:name => 'Tonga', :iso3 => 'TON', :iso2 => 'TO', :numcode => 776)
    Country.create(:name => 'Trinidad and Tobago', :iso3 => 'TTO', :iso2 => 'TT', :numcode => 780)
    Country.create(:name => 'Tunisia', :iso3 => 'TUN', :iso2 => 'TN', :numcode => 788)
    Country.create(:name => 'Turkey', :iso3 => 'TUR', :iso2 => 'TR', :numcode => 792)
    Country.create(:name => 'Turkmenistan', :iso3 => 'TKM', :iso2 => 'TM', :numcode => 795)
    Country.create(:name => 'Turks and Caicos Islands', :iso3 => 'TCA', :iso2 => 'TC', :numcode => 796)
    Country.create(:name => 'Tuvalu', :iso3 => 'TUV', :iso2 => 'TV', :numcode => 798)
    Country.create(:name => 'Uganda', :iso3 => 'UGA', :iso2 => 'UG', :numcode => 800)
    Country.create(:name => 'Ukraine', :iso3 => 'UKR', :iso2 => 'UA', :numcode => 804)
    Country.create(:name => 'United Arab Emirates', :iso3 => 'ARE', :iso2 => 'AE', :numcode => 784)
    Country.create(:name => 'United Kingdom', :iso3 => 'GBR', :iso2 => 'GB', :numcode => 826)
    Country.create(:name => 'United States', :iso3 => 'USA', :iso2 => 'US', :numcode => 840)
    Country.create(:name => 'United States Minor Outlying Islands', :iso3 => 'UMI', :iso2 => 'UM', :numcode => 581)
    Country.create(:name => 'Uruguay', :iso3 => 'URY', :iso2 => 'UY', :numcode => 858)
    Country.create(:name => 'Uzbekistan', :iso3 => 'UZB', :iso2 => 'UZ', :numcode => 860)
    Country.create(:name => 'Vanuatu', :iso3 => 'VUT', :iso2 => 'VU', :numcode => 548)
    Country.create(:name => 'Venezuela', :iso3 => 'VEN', :iso2 => 'VE', :numcode => 862)
    Country.create(:name => 'Viet Nam', :iso3 => 'VNM', :iso2 => 'VN', :numcode => 704)
    Country.create(:name => 'Virgin Islands, British', :iso3 => 'VGB', :iso2 => 'VG', :numcode => 92)
    Country.create(:name => 'Virgin Islands, U.S.', :iso3 => 'VIR', :iso2 => 'VI', :numcode => 850)
    Country.create(:name => 'Wallis and Futuna', :iso3 => 'WLF', :iso2 => 'WF', :numcode => 876)
    Country.create(:name => 'Western Sahara', :iso3 => 'ESH', :iso2 => 'EH', :numcode => 732)
    Country.create(:name => 'Yemen', :iso3 => 'YEM', :iso2 => 'YE', :numcode => 887)
    Country.create(:name => 'Zambia', :iso3 => 'ZMB', :iso2 => 'ZM', :numcode => 894)
    Country.create(:name => 'Zimbabwe', :iso3 => 'ZWE', :iso2 => 'ZW', :numcode => 716)


  end
end
