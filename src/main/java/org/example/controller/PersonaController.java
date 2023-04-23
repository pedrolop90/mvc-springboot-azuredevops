package org.example.controller;

import lombok.RequiredArgsConstructor;
import org.example.dto.SaludarResponse;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/personas")
@RequiredArgsConstructor
public class PersonaController {


    @GetMapping
    public SaludarResponse saludar() {
        return SaludarResponse
                .builder()
                .saludar("hola")
                .build();
    }

}
