package ru.itis.rest.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import ru.itis.rest.dto.ProfileInfoDto;
import ru.itis.rest.model.User;

@Service
public class ProfileServiceImpl {

    @Value("${default.ava.path}")
    private String path;

    public ProfileInfoDto getProfileInfo(User user) {

        String pathToAva = user.getPathToAva();

        return ProfileInfoDto.builder()
                .firstName(user.getFirstName())
                .secondName(user.getSecondName())
                .town(user.getTown())
                .birthDate(user.getBirthDate())
                .pathToAva(pathToAva == null ? path : pathToAva)
                .build();

    }

}
