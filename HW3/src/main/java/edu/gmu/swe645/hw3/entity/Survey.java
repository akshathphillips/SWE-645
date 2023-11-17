package edu.gmu.swe645.hw3.entity;

import jakarta.persistence.*;

import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "Survey")
public class Survey {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "first_name", nullable = false)
    private String firstName;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "street_address", nullable = false)
    private String streetAddress;

    @Column(name = "city", nullable = false)
    private String city;

    @Column(name = "state", nullable = false)
    private String state;

    @Column(name = "zip", nullable = false)
    private String zip;

    @Column(name = "telephone_number", nullable = false)
    private String telephoneNumber;

    @Column(name = "email", nullable = false)
    private String email;

    @Column(name = "date_of_survey", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateOfSurvey;

    @ElementCollection(targetClass = LikedMost.class)
    @Enumerated(EnumType.STRING)
    @CollectionTable(name = "liked_most_options", joinColumns = @JoinColumn(name = "survey_id"))
    private Set<LikedMost> likedMostOptions;

    @Enumerated(EnumType.STRING)
    @Column(name = "interested_in")
    private InterestedIn interestedIn;

    @Enumerated(EnumType.STRING)
    @Column(name = "likelihood_to_recommend")
    private LikelihoodToRecommend likelihoodToRecommend;

    @Column(name = "additional_comments", columnDefinition = "TEXT")
    private String additionalComments;

    public enum LikedMost {
        STUDENTS, LOCATION, CAMPUS, ATMOSPHERE, DORM_ROOMS, SPORTS
    }

    public enum InterestedIn {
        FRIENDS, TELEVISION, INTERNET, OTHER
    }

    public enum LikelihoodToRecommend {
        VERY_LIKELY, LIKELY, UNLIKELY
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getTelephoneNumber() {
        return telephoneNumber;
    }

    public void setTelephoneNumber(String telephoneNumber) {
        this.telephoneNumber = telephoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getDateOfSurvey() {
        return dateOfSurvey;
    }

    public void setDateOfSurvey(Date dateOfSurvey) {
        this.dateOfSurvey = dateOfSurvey;
    }

    public Set<LikedMost> getLikedMostOptions() {
        return likedMostOptions;
    }

    public void setLikedMostOptions(Set<LikedMost> likedMostOptions) {
        this.likedMostOptions = likedMostOptions;
    }

    public InterestedIn getInterestedIn() {
        return interestedIn;
    }

    public void setInterestedIn(InterestedIn interestedIn) {
        this.interestedIn = interestedIn;
    }

    public LikelihoodToRecommend getLikelihoodToRecommend() {
        return likelihoodToRecommend;
    }

    public void setLikelihoodToRecommend(LikelihoodToRecommend likelihoodToRecommend) {
        this.likelihoodToRecommend = likelihoodToRecommend;
    }

    public String getAdditionalComments() {
        return additionalComments;
    }

    public void setAdditionalComments(String additionalComments) {
        this.additionalComments = additionalComments;
    }
}
