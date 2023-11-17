package edu.gmu.swe645.hw3.controller;

import edu.gmu.swe645.hw3.entity.Survey;
import edu.gmu.swe645.hw3.repository.SurveyRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/surveys")
public class SurveyController {
    private final SurveyRepository surveyRepository;

    public SurveyController(SurveyRepository surveyRepository) {
        this.surveyRepository = surveyRepository;
    }

    @PostMapping
    public Survey saveSurvey(@RequestBody Survey survey) {
        return surveyRepository.save(survey);
    }

    @GetMapping
    public List<Survey> getAllSurveys() {
        return surveyRepository.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<Survey> getSurveyById(@PathVariable Long id) {
        Optional<Survey> survey = surveyRepository.findById(id);
        return survey.map(value -> new ResponseEntity<>(value, HttpStatus.OK)).orElseGet(() -> new ResponseEntity<>(HttpStatus.NOT_FOUND));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteSurveyById(@PathVariable Long id) {
        Optional<Survey> survey = surveyRepository.findById(id);
        if (survey.isPresent()) {
            surveyRepository.deleteById(id);
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<Survey> updateSurveyById(@PathVariable Long id, @RequestBody Survey updatedSurvey) {
        Optional<Survey> existingSurvey = surveyRepository.findById(id);
        if (existingSurvey.isPresent()) {
            Survey survey = existingSurvey.get();
            BeanUtils.copyProperties(updatedSurvey, survey, "id");
            surveyRepository.save(survey);
            return new ResponseEntity<>(survey, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }
}

