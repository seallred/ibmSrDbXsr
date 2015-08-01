-- APP_ID   APP_TYPE DESCRIPTION
-- 2  XSR   xSR Problem Submission and Tracking Tool
-- 3  XAT   xSR Admin Tool
select * from xsr.app_type;

-- ALL RIGHTS DATA for SR External Application
select a.app_type, aa.action_name, aa.user_type, aa.admin_rights_id, ar.right
  from xsr.app_type a, xsr.appl_auth aa, xsr.admin_rights ar
 where a.app_id = ar.app_id
   and aa.admin_rights_id = ar.admin_rights_id
   and ar.app_id = 2
order by action_name, user_type, right;


-- ALL RIGHTS DATA in XSR
select a.app_id, a.app_type, aa.action_name, aa.user_type, ar.admin_rights_id, ar.right, ar.description
  from xsr.app_type a, xsr.appl_auth aa, xsr.admin_rights ar
 where a.app_id = ar.app_id
   and aa.admin_rights_id = ar.admin_rights_id
order by app_type, action_name, user_type, right;


-- XAT
select * from xsr.admin_rights where app_id = 3;
-- Current Rights
-- advancedRouteEdit
-- advancedRouteImport
-- advancedRouteView
-- basicRouteEdit
-- basicRouteView
-- componentGroupEdit
-- componentGroupView
-- logView
-- countryConfigEdit
-- countryConfigView
-- serviceRequestEdit
-- serviceRequestView
-- userProfileEdit
-- userProfileView
-- userRightsEdit
-- userRightsView
--
