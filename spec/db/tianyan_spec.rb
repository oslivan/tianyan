require 'byebug'

RSpec.describe Tianyan do
  # let(:tianyan) { create(:tianyan) }

  describe "#create" do
    it "should be success" do
      payload = '{
        "result": {
          "historyNames": "贵州力源液压股份有限公司;",
          "cancelDate": null,
          "regStatus": "存续",
          "regCapital": "77800.32万人民币",
          "city": "毕节市",
          "staffNumRange": "5000-9999人",
          "bondNum": "600765",
          "historyNameList": ["贵州力源液压股份有限公司"],
          "industry": "汽车制造业",
          "bondName": "中航重机",
          "revokeDate": null,
          "type": 1,
          "updateTimes": 1620622963000,
          "legalPersonName": "姬苏春",
          "revokeReason": "",
          "regNumber": "520000000005018",
          "creditCode": "91520000214434146R",
          "property3": "AVIC Heavy Machinery Co.,Ltd.",
          "usedBondName": "力源液压->G力源->力源液压",
          "approvedTime": 1582646400000,
          "fromTime": 847900800000,
          "socialStaffNum": 9023,
          "actualCapitalCurrency": "人民币",
          "alias": "中航重机",
          "companyOrgType": "其他股份有限公司(上市)",
          "id": 11684584,
          "cancelReason": "",
          "orgNumber": "214434146",
          "email": "zhzj@avic.com",
          "toTime": null,
          "actualCapital": "77800.32万人民币",
          "estiblishTime": 847900800000,
          "regInstitute": "贵阳市市场监督管理局贵州双龙航空港经济区分局",
          "businessScope": "法律、法规、国务院决定规定禁止的不得经营；法律、法规、国务院决定规定应当许可（审批）的，经审批机关批准后凭许可（审批）文件经营;法律、法规、国务院决定规定无需许可（审批）的，市场主体自主选择经营。（股权投资及经营管理；军民共用液压件、液压系统、锻件、铸件、换热器、飞机及航空发动机附件，汽车零备件的研制、开发、制造、修理及销售；经营本企业自产机电产品、成套设备及相关技术的出口业务；经营本企业生产、科研所需的原辅材料、机械设备、仪器仪表、备品备件、零配件及技术的进口业务；开展本企业进料加工和“三来一补”业务。液压、锻件、铸件、换热器技术开发、转让和咨询服务；物流；机械冷热加工、修理修配服务。）",
          "taxNumber": "91520000214434146R",
          "regLocation": "贵州双龙航空港经济区机场路9号太升国际A栋3单元5层",
          "regCapitalCurrency": "人民币",
          "tags": "企业集团;存续;融资轮次;上市信息;项目品牌;投资机构;曾用名",
          "websiteList": "www.hm.avic.com",
          "phoneNumber": "0851-88600765",
          "district": "威宁彝族回族苗族自治县",
          "bondType": "A股",
          "name": "中航重机股份有限公司",
          "percentileScore": 9696,
          "industryAll": {
            "categoryMiddle": "改装汽车制造",
            "categoryBig": "汽车制造业",
            "category": "制造业",
            "categorySmall": ""
          },
          "isMicroEnt": 0,
          "base": "gz"
        }
      }'

      body = JSON.parse(payload, symbolize_names: true)
      ty = create(:tianyan, body[:result])
      expect(ty.name).to eq('中航重机股份有限公司')
    end
  end
end
