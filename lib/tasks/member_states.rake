# encoding: utf-8
namespace :member_states do
  
  task :create => :environment do
    
    BidState.create id: 1, name: "-"
    BidState.create id: 2, name: "Опубликована на сайте"
    BidState.create id: 3, name: "Включена в шот-лист"
    BidState.create id: 4, name: "Присвоить место в номинации"
    
    CompetitionState.create id: 1, name: "-"
    CompetitionState.create id: 2, name: "Зарегистирован"
    CompetitionState.create id: 3, name: "Прошел во  второй тур"
    CompetitionState.create id: 4, name: "Участник финальных мероприятий"
    CompetitionState.create id: 5, name: "Финалист в номинации"
    
  end
end
