package db;

public interface Persistencia{
    public String toString();
    public void toObject(String object) throws IllegalArgumentException;
}
