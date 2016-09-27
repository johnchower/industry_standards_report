select u.date_id, u.user_id
from user_platform_action_facts u
join user_dimensions ud
on u.user_id = ud.id
where ud.email NOT SIMILAR TO '%(test|tester|gloowizard|tangogroup|gloo|cru|example|lauderdale|10|doe|tango|singularity-interactive)%'
