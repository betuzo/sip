package org.valledelbit.sip



import org.junit.*
import grails.test.mixin.*

@TestFor(PersonalController)
@Mock(Personal)
class PersonalControllerTests {


    def populateValidParams(params) {
      assert params != null
      // TODO: Populate valid properties like...
      //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/personal/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.personalInstanceList.size() == 0
        assert model.personalInstanceTotal == 0
    }

    void testCreate() {
       def model = controller.create()

       assert model.personalInstance != null
    }

    void testSave() {
        controller.save()

        assert model.personalInstance != null
        assert view == '/personal/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/personal/show/1'
        assert controller.flash.message != null
        assert Personal.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/personal/list'


        populateValidParams(params)
        def personal = new Personal(params)

        assert personal.save() != null

        params.id = personal.id

        def model = controller.show()

        assert model.personalInstance == personal
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/personal/list'


        populateValidParams(params)
        def personal = new Personal(params)

        assert personal.save() != null

        params.id = personal.id

        def model = controller.edit()

        assert model.personalInstance == personal
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/personal/list'

        response.reset()


        populateValidParams(params)
        def personal = new Personal(params)

        assert personal.save() != null

        // test invalid parameters in update
        params.id = personal.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/personal/edit"
        assert model.personalInstance != null

        personal.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/personal/show/$personal.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        personal.clearErrors()

        populateValidParams(params)
        params.id = personal.id
        params.version = -1
        controller.update()

        assert view == "/personal/edit"
        assert model.personalInstance != null
        assert model.personalInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/personal/list'

        response.reset()

        populateValidParams(params)
        def personal = new Personal(params)

        assert personal.save() != null
        assert Personal.count() == 1

        params.id = personal.id

        controller.delete()

        assert Personal.count() == 0
        assert Personal.get(personal.id) == null
        assert response.redirectedUrl == '/personal/list'
    }
}
