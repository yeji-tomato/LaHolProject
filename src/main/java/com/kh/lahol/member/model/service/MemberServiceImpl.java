package com.kh.lahol.member.model.service;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.lahol.member.model.dao.MemberDao;
import com.kh.lahol.member.model.vo.Cafe;
import com.kh.lahol.member.model.vo.M_Partner;
import com.kh.lahol.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDao mDao;

	@Override
	public Member loginMember(Member m) {
		return null;
	}

	@Override
	public Member selectMember(String userId) {
		return mDao.selectMember(userId);
	}

	// 일반회원가입
	@Override
	public int insertnMember(Member m) {
		return mDao.insertnMember(m);
	}

	@Override
	public Member selectMemberByNickname(String nickname) {
		return mDao.selectMemberByNickname(nickname);
	}

	@Override
	public int insertpMember(M_Partner m) {
		int result = mDao.insertpMember(m);
		
		if(result > 0) {
			return mDao.insertpMember2(m);
		} else {
			return 0;
		}
	}

	@Override
	public int insertCafe(Cafe c) {
		return mDao.insertCafe(c);
	}

	@Override
	public Member idSearch(Member m) {
		return mDao.idSearch(m);
	}

	@Override
	public Member pwdSearch(Member m) {
		return mDao.pwdSearch(m);
	}

	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(m);
	}

	@Override
	public String sendEmail(Member m, String div) {
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "arkphong1@naver.com";
		String hostSMTPpwd = "khxptmxm123!";
		
		String fromEmail = "arkphong1@naver.com";
		String fromName = "laHol";
		String subject = "";
		String msg = "";
		
		if(div.equals("tempPwd")) {
			subject = "laHol 임시 비밀번호 안내 입니다.";
			msg += "<table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">";
			msg += "<tr>";
			msg += "<td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">";
			msg += "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">";
			msg += "<tr>";
			msg += "<td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">";
			msg += "<p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">안녕하세요, laHol 임시 비밀번호 안내입니다.</p>\r\n" + 
					"                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">" + m.getId() + "님의 임시비밀번호는 " + m.getPwd() + "입니다.</p>";
			msg += "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; box-sizing: border-box;\">\r\n" + 
					"                          <tbody>\r\n" + 
					"                            <tr>\r\n" + 
					"                              <td align=\"left\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;\">\r\n" + 
					"                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;\">\r\n" + 
					"                                  <tbody>\r\n" + 
					"                                    <tr>\r\n" + 
					"                                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; background-color: #3498db; border-radius: 5px; text-align: center;\"> <a href=\"http://localhost:8828/lahol\" target=\"_blank\" style=\"display: inline-block; color: #ffffff; background-color: #5A452E; border: solid 1px #5A452E; border-radius: 5px; box-sizing: border-box; cursor: pointer; text-decoration: none; font-size: 14px; font-weight: bold; margin: 0; padding: 12px 25px; text-transform: capitalize; border-color: #5A452E;\">laHol 홈페이지</a> </td>\r\n" + 
					"                                    </tr>\r\n" + 
					"                                  </tbody>\r\n" + 
					"                                </table>\r\n" + 
					"                              </td>\r\n" + 
					"                            </tr>\r\n" + 
					"                          </tbody>\r\n" + 
					"                        </table>";
			msg += "<p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">로그인 후 마이페이지에서 반드시 비밀번호를 변경해 주시기 바랍니다.</p>\r\n" + 
					"                      </td>\r\n" + 
					"                    </tr>\r\n" + 
					"                  </table>";
			msg += "</td>\r\n" + 
					"              </tr>\r\n" + 
					"\r\n" + 
					"            </table>";
			
		}
		
		String mail = m.getEmail();
		
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587);
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
			return "이메일로 임시비밀번호가 발송 되었습니다.";
		} catch (EmailException e) {
			e.printStackTrace();
			return "이메일 발송 실패";
		}
		
	}

}
