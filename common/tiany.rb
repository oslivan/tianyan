# 天眼查相关接口
module Common
  class Tiany
    class << self
      # 搜索企业名称
      # @param text [String] 搜索关键字
      # @param page_no [Integer] 页码
      # @param page_size [Integer] 每页数量
      # @return total
      # @return items
      # @return err_message
      def search_name(text, page_no = 1, page_size = 8)
        query = {
          word: text, pageSize: page_size, pageNum: page_no
        }

        url = "http://open.api.tianyancha.com/services/open/search/2.0"
        body = Faraday.get(url, query, auth_token).body
        data = result(body)

        ret = { total: 0, items: [] }
        if data[:error_code] == 0
          ret[:total] = data[:result][:total]
          ret[:items] = data[:result][:items]
        else
          ret[:err_message] = format("[%d] %s", data[:error_code], data[:reason])
        end
        ret
      end

      # 搜索企业信息(含企业联系方式)
      # @param keyword 企业名字
      # @return error_code 错误码
      # @return reason 错误原因
      # @return result 结果
      def search(name)
        url = "http://open.api.tianyancha.com/services/open/ic/baseinfoV2/2.0"
        body = Faraday.get(url, { keyword: name }, auth_token).body
        data = result(body)
        ret = {}
        if data[:error_code] == 0
          ret[:result] = data[:result]
        else
          ret[:err_message] = format("[%d] %s", data[:error_code], data[:reason])
        end
        ret
      end

      private

      def result(response)
        JSON.parse(response, symbolize_names: true)
      end

      def auth_token
        @auth_token ||= { Authorization: Settings.values[:tianyan][:token] }
      end
    end
  end
end

__END__

{:result=>
  {:historyNames=>"上海迈坦信息科技有限公司",
   :cancelDate=>nil,
   :regStatus=>"存续",
   :regCapital=>"232.7619万人民币",
   :city=>"市辖区",
   :compForm=>nil,
   :staffNumRange=>"小于50人",
   :bondNum=>nil,
   :historyNameList=>["上海迈坦信息科技有限公司"],
   :industry=>"科技推广和应用服务业",
   :bondName=>nil,
   :revokeDate=>nil,
   :type=>1,
   :updateTimes=>1689308088000,
   :legalPersonName=>"林贤杰",
   :revokeReason=>nil,
   :regNumber=>"310110000719339",
   :creditCode=>"91310110324425929E",
   :property3=>"",
   :usedBondName=>nil,
   :approvedTime=>1645718400000,
   :fromTime=>1421683200000,
   :socialStaffNum=>40,
   :actualCapitalCurrency=>"人民币",
   :alias=>"迈坦信息",
   :companyOrgType=>"有限责任公司(自然人投资或控股)",
   :id=>2322885604,
   :cancelReason=>nil,
   :orgNumber=>"32442592-9",
   :toTime=>2999520000000,
   :actualCapital=>"103.8448万人民币",
   :estiblishTime=>1421683200000,
   :regInstitute=>"北京市朝阳区市场监督管理局",
   :businessScope=>
    "技术开发、技术咨询、技术转让、技术服务；设计、制作、代理、发布广告；会议服务；承办展览展示活动；
组织文化艺术交流活动（不含演出）。（市场主体依法自主选择经营项目，开展经营活动；依法须经批准的项目，经
相关部门批准后依批准的内容开展经营活动；不得从事国家和本市产业政策禁止和限制类项目的经营活动。）",
   :taxNumber=>"91310110324425929E",
   :regLocation=>"北京市朝阳区利泽西街6号院3号楼4层401内5",
   :regCapitalCurrency=>"人民币",
   :tags=>"存续;曾用名;C轮;高新技术企业;科技型中小企业;小微企业;项目品牌:迈科技;企业族群",
   :district=>"朝阳区",
   :bondType=>nil,
   :name=>"北京迈坦信息科技有限公司",
   :percentileScore=>5952,
   :industryAll=>
    {:categoryMiddle=>"技术推广服务",
     :categoryBig=>"科技推广和应用服务业",
     :category=>"科学研究和技术服务业",
     :categorySmall=>""},
   :isMicroEnt=>1,
   :base=>"bj"}}