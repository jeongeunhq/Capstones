package capstone.project.controller.member;

import capstone.project.domain.Member;
import capstone.project.repository.member.MemberUpdateDto;
import capstone.project.service.member.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/members")
public class MemberController {

    private final MemberService memberService;

    // 회원 목록을 보여주는 엔드포인트
    @GetMapping
    public String members(@ModelAttribute("member") Member member, Model model) {
        List<Member> members = memberService.findMembers(member);
        model.addAttribute("members", members);
        return "member/members";
    }

    // 회원 추가 폼을 보여주는 엔드포인트
    @GetMapping("/add")
    public String addForm() {
        return "member/addForm";
    }

    // 회원을 추가하고 해당 회원 정보 페이지로 리다이렉트하는 엔드포인트
    @PostMapping("/add")
    public String addMember(@ModelAttribute Member member, RedirectAttributes redirectAttributes) {
        Member savedMember = memberService.save(member);
        redirectAttributes.addAttribute("id", savedMember.getId());
        redirectAttributes.addAttribute("status", true);
        return "redirect:/members/{id}";
    }

    // 특정 회원 정보를 보여주는 엔드포인트
    @GetMapping("/{id}")
    public String member(@PathVariable("id") int id, Model model) {
        Member member = memberService.findById(id).get();
        model.addAttribute("member", member);
        return "member/member";
    }

    // 특정 회원의 정보 수정 폼을 보여주는 페이지를 반환하는 엔드포인트
    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable("id") int id, Model model) {
        Member member = memberService.findById(id).get();
        model.addAttribute("member", member);
        return "member/editForm";
    }

    // 특정 회원의 정보를 수정하고 해당 회원 정보 페이지로 리다이렉트하는 엔드포인트
    @PostMapping("/{id}/edit")
    public String edit(@PathVariable("id") int id, @ModelAttribute MemberUpdateDto updateParam) {
        memberService.update(id, updateParam);
        return "redirect:/members/{id}";
    }
}
