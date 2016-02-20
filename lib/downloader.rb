class Downloader

  DOWNLOAD_PATH = 'https://acpmasquerade-nepal-loadshedding-schedule-by-sparrow-sms.p.mashape.com/schedule.php'
  API_KEY = '8ibMI63bqPmshv9aq5XoZtwTDNxBp11nUMNjsnVVa3A88wMy1E'
  HEADER = 'X-Mashape-Key'
  INSTALL_PATH = File.expand_path('assets/schedule.yml')
  attr_reader :path, :schedule_json

  def initialize(download_path=nil)
    @path ||= download_path || DOWNLOAD_PATH
    @schedule_json = Hash.new
  end

  def download
    (1..7).each do |group|
      group_schedule = download_for_group(group)
      @schedule_json.merge!({group => group_schedule})
    end
  end

  private

  def download_for_group group
    result = HTTParty.get(DOWNLOAD_PATH, verify: false ,query: {format: :json, group: group}, headers: {HEADER => API_KEY})
    parsed_data = JSON.parse(result.parsed_response)
    parsed_data["schedule"]
  end
end
