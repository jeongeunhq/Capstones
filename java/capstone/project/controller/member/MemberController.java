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

    @GetMapping
    public String members(@ModelAttribute("member") Member member, Model model) {
        List<Member> members = memberService.findMembers(member);
        model.addAttribute("members", members);
        return "member/members";
    }

    @GetMapping("/add")
    public String addForm() {
        return "member/addForm";
    }

    @PostMapping("/add")
    public String addMember(@ModelAttribute Member member, RedirectAttributes redirectAttributes) {
        Member savedMember = memberService.save(member);
        redirectAttributes.addAttribute("id", savedMember.getId());
        redirectAttributes.addAttribute("status", true);
        return "redirect:/members/{id}";
    }

    @GetMapping("/{id}")
    public String member(@PathVariable("id") int id, Model model) {
        Member member = memberService.findById(id).get();
        model.addAttribute("member", member);
        return "member/member";
    }

    @GetMapping("/{id}/edit")
    public String editForm(@PathVariable("id") int id, Model model) {
        Member member = memberService.findById(id).get();
        model.addAttribute("member", member);
        return "member/editForm";
    }

    @PostMapping("/{id}/edit")
    public String edit(@PathVariable("id") int id, @ModelAttribute MemberUpdateDto updateParam) {
        memberService.update(id, updateParam);
        return "redirect:/members/{id}";
    }
}
