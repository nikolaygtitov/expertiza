# E1920
# Code Climate mistakenly reports
# "Mass assignment is not restricted using attr_accessible"
# https://github.com/presidentbeef/brakeman/issues/579
#
# Remove html_safe and eliminate DRY code

class TableHeader < QuestionnaireHeader
  # Code Climate suggestion to use safe_join instead of html_safe
  def complete(_count, _answer = nil)
    safe_join(make_header)
  end

  def view_completed_question(_count, _answer)
    safe_join(make_header)
  end

  private

  def make_header
    ['<br/><big><b>', self.txt, '</b></big><br/>',
     '<table class="general" style="border: 2; text-align: left; width: 100%">']
  end
end
